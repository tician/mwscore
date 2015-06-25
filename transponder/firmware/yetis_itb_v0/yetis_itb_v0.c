/*
 *******************************************************************************
 *  Copyright (c) 2012, 2013, 2014, 2015 Matthew Paulishen. All rights reserved.
 *  
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *  
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *  
 *******************************************************************************
 */

// sudo avrdude -c usbasp -P USB -p t85 -v -U flash:w:./yetis_itb_v0.hex


#include <stdint.h>
#include <stdio.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/eeprom.h>

#if defined(__ATtiny25__) | defined(__ATtiny45__) | defined(__ATtiny85__)
#define I2C_ENABLED		1
#include "usiTwiSlave.h"

#else
#error 'INVALID DEVICE'
#endif

#ifndef YETIS_MODEL
#define YETIS_MODEL					0x01
#endif
#ifndef YETIS_HARDWARE_REVISION
#define YETIS_HARDWARE_REVISION		0
#endif
#ifndef YETIS_FIRMWARE_REVISION
#define YETIS_FIRMWARE_REVISION 	0
#endif

/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// PIN DEFINITIONS (LSB)
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	PB0 - I/O - SDA												DIP-P5	MOSI
	PB1 - OUT - LED2 -	Pin : 62[Ohm] : [>] : [>] : GND			DIP-P6	MISO
	PB2 - I/O - SCL												DIP-P7	SCK
	PB3 - OUT - BUZZER											DIP-P2
	PB4 - OUT - LED1 -	Pin : 62[Ohm] : [>] : [>] : GND			DIP-P3
	PB5 - N/A - RESET											DIP-P1	!RESET
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define LED1_OFF()	{PORTB &=~(1<<PIN4);}
#define LED1_ON()	{PORTB |= (1<<PIN4);}
#define LED2_OFF()	{PORTB &=~(1<<PIN1);}
#define LED2_ON()	{PORTB |= (1<<PIN1);}
#define BUZZ_OFF()	{PORTB &=~(1<<PIN3);}
#define BUZZ_ON()	{PORTB |= (1<<PIN3);}
*/

/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// PIN DEFINITIONS (LTB)
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	PB0 - I/O - SDA												DIP-P5	MOSI
	PB1 - OUT - LED2 -	Pin : 62[Ohm] : [>] : [>] : GND			DIP-P6	MISO
	PB2 - I/O - SCL												DIP-P7	SCK
	PB3 - ADC - BUTTON/SENSE (ADC3)								DIP-P2
	PB4 - OUT - LED1 -	Pin : 62[Ohm] : [>] : [>] : GND			DIP-P3
	PB5 - N/A - RESET											DIP-P1	!RESET
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
#define LED1_OFF()	{PORTB &=~(1<<PIN4);}
#define LED1_ON()	{PORTB |= (1<<PIN4);}
#define LED2_OFF()	{PORTB &=~(1<<PIN1);}
#define LED2_ON()	{PORTB |= (1<<PIN1);}

/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Calibration Mode
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
All FSRs are connected in parallel to SENSE/ADC3 with a 10k external pull-up
Pull RESET low to reboot at any time; will clear all settings not saved to EEPROM.

	Write FSR_CALIBRATION_MODE_ENABLE = 1
		(LED1 on; LED2 flashing at ~5Hz)
		Shoot target panel as many times as desired.
			Board will save 20 biggest impacts
	Write FSR_CALIBRATION_MODE_ENABLE = 0
	Test out new value
	Write to EEPROM?
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/


/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// I2C Enabled
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I2C Slave
  I2C_Stop_Check() called every 1ms in the millis increment callback function.


///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

uint8_t EEMEM eep_model = YETIS_MODEL;
uint8_t EEMEM eep_vhard = YETIS_HARDWARE_REVISION;
uint8_t EEMEM eep_vfirm = YETIS_FIRMWARE_REVISION;
uint8_t EEMEM eep_idOffset = 0;	// Offset from model's minimum ID

uint8_t EEMEM eep_hit_durationL = (1000>>0)&0xFF;	// [ms]
uint8_t EEMEM eep_hit_durationH = (1000>>8)&0xFF;	// [ms]
uint8_t EEMEM eep_hit_standoffL = (1000>>0)&0xFF;	// [ms]
uint8_t EEMEM eep_hit_standoffH = (1000>>8)&0xFF;	// [ms]
uint8_t EEMEM eep_dph_value = 1;	// [damage per hit]

uint8_t EEMEM eep_fsr_sdph = 5;	// Sequential ADC Detections Per Hit
uint8_t EEMEM eep_fsr_threshold = 230;	// ADC Threshold for Detection

uint8_t EEMEM eep_leds_hit = (LEDS_ALTERNATING | FREQ_10_000Hz);
uint8_t EEMEM eep_leds_flag = (LEDS_SYNCHRONOUS | FREQ_05_000Hz);
uint8_t EEMEM eep_leds_cap = (LEDS_FLOWING | FREQ_05_000Hz);

/*
uint8_t EEMEM eep_buzz_hit = (BUZZ_WARBLE | FREQ_02_000Hz);
uint8_t EEMEM eep_buzz_flag = (BUZZ_BEEP_HIGH | FREQ_05_000Hz);
uint8_t EEMEM eep_buzz_cap = (BUZZ_RISING | FREQ_01_000Hz);
*/


volatile uint8_t x00_table[] =
{			// ADDR: NAME
	0x00,	// 0x00: Model Number						(R-)
				// LIGHTS/TARGET BOARD:	0x01
				// LIGHTS/SOUNDS BOARD:	0x02
				// FIRE CONTROL BOARD:	0x05
	0x00,	// 0x01: Hardware Revision					(R-)
	0x00,	// 0x02: Firmware Revision					(R-)
	0x00	// 0x03: ID Number							(RW)
				// LIGHTS/TARGET BOARD:	0x00~0x1F
				// LIGHTS/SOUNDS BOARD:	0x20~0x2F
				// FIRE CONTROL BOARD:	0x50~0x5F

};
const uint8_t x00_table_size = sizeof(x00_table);

volatile uint8_t x10_table[] =
{			// ADDR: NAME
	0x00,	// 0x10: Status
				// Bit-0: (R-) IM_HIT (cleared when READ by master)
				// Bit-1: (-W) OTHER_HIT
				// Bit-2: (-W) HAVE_FLAG
				// Bit-3: (-W) AM_CAPTURING

				// Bit-3: (--) RESERVED for future use
				// Bit-3: (--) RESERVED for future use
				// Bit-6: (-W) SAVE current settings to EEPROM
				// Bit-7: (-W) RESET (to EEPROM defaults using WDReset)
	0x00,	// 0x11: Damage since last reboot(L)		(R-) (0x0000~0xFFFF)
	0x00	// 0x12: Damage since last reboot(H)		(R-) (0x0000~0xFFFF)
};
const uint8_t x10_table_size = sizeof(x10_table);

volatile uint8_t x20_table[] =
{			// ADDR: NAME
	0x00,	// 0x20: Hit Duration [ms](L)				(RW) (0x0000~0xFFFF)
	0x00,	// 0x21: Hit Duration [ms](H)				(RW) (0x0000~0xFFFF)
	0x00,	// 0x22: Hit Standoff [ms](L)				(RW) (0x0000~0xFFFF)
	0x00,	// 0x23: Hit Standoff [ms](H)				(RW) (0x0000~0xFFFF)
	0x00	// 0x24: Damage-Per-Hit Value				(RW) (0x00~0xFF)

};
const uint8_t x20_table_size = sizeof(x20_table);

volatile uint8_t x30_table[] =
{			// ADDR: NAME
	0x00,	// 0x30: FSR Sequential Detections Per Hit	(RW) (1~50)
	0x00,	// 0x31: FSR Threshold						(RW) (50~250)
	0x00	// 0x32: FSR CALIBRATION MODE ENABLE		(RW) (0~1)
};
const uint8_t x30_table_size = sizeof(x30_table);

/*
	LED: xSSS FRRR
		F
				1	FORCE_ACTIVE
		RRR
				000	FREQ_00_000Hz
				001	FREQ_00_125Hz
				010	FREQ_00_250Hz
				011	FREQ_00_500Hz
				100	FREQ_01_000Hz
				101	FREQ_02_000Hz
				110	FREQ_05_000Hz
				111	FREQ_10_000Hz
		SSS
				000	ALTERNATING
				001	SYNCHRONOUS
				010	FLOWING (NONE, CH1, CH1+CH2, CH2, NONE)
				011	CH1_ONLY
				100	CH2_ONLY
				101	CH1_SOLID + CH2_FLASHING
				110	CH1_FLASHING + CH2_SOLID

*/
volatile uint8_t x40_table[] =
{			// ADDR: NAME
	0x00,	// 0x40: LED Hit Value						(RW) (0x00~0xFF)
	0x00,	// 0x41: LED Flag Value						(RW) (0x00~0xFF)
	0x00,	// 0x42: LED Capture Value					(RW) (0x00~0xFF)
	0x00	// 0x43: LED State							(RW) (0x00~0xFF)
};
const uint8_t x40_table_size = sizeof(x40_table);

/*
	BUZZER: xSSS FRRR
		F
				1	FORCE_ACTIVE
		RRR
				000	FREQ_00_000Hz
				001	FREQ_00_125Hz
				010	FREQ_00_250Hz
				011	FREQ_00_500Hz
				100	FREQ_01_000Hz
				101	FREQ_02_000Hz
				110	FREQ_05_000Hz
				111	FREQ_10_000Hz
		SSS
				000	BEEP_LOW
				001	BEEP_MID
				010	BEEP_HIGH
				011	WARBLE
				100	WAHWAHWAH
				101	RISING
				110	FALLING
*/
/*
volatile uint8_t x50_table[] =
{			// ADDR: NAME
	0x00,	// 0x50: Buzzer Hit Value					(RW) (0x00~0xFF)
	0x00,	// 0x51: Buzzer Flag Value					(RW) (0x00~0xFF)
	0x00,	// 0x52: Buzzer Capture Value				(RW) (0x00~0xFF)
	0x00	// 0x53: Buzzer State						(RW) (0x00~0xFF)
};
const uint8_t x50_table_size = sizeof(x50_table);
*/
/*
volatile uint8_t x60_table[] =
{			// ADDR: NAME
};
const uint8_t x60_table_size = sizeof(x60_table);
*/

// Tracks the current register address
volatile uint8_t reg_addr;

// Tracks whether to start a conversion cycle
volatile bool start_conversion;


void setup()
{
#if defined(__ATtiny13A__)
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Change Main Clock Divisor to 1 (9.6MHz)
	CLKPR = (1<<CLKPCE);
	CLKPR = 0;
#endif

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	grabFromEEPROM();

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Set PB4 and PB1 output (LED outputs enabled)
	DDRB = (1<<PIN1) | (1<<PIN4);
	// Set PB4 and PB1 low (LEDs OFF)
	PORTB &= ~((1<<PIN1) | (1<<PIN4));
	// Disable PB3/ADC3 pull-up (use 10k external pull-up)
	PORTB &= ~(1<<PIN3);

#if (YETIS_MODEL == 0x01)
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// ADC Setup for normal usage
	// Use Vcc as reference, Left Adjust Result, Select ADC3
	ADMUX = (0 << REFS0) | (1 << ADLAR) | (1 << MUX1) | (1 << MUX0);
	// Power saving by disable digital input buffer for dedicated ADC pin
	DIDR0 = (1 << ADC3D);
	// ADC Enable, Clock 1/2 div. (1.2MHz/2 => 600kHz) (9.6MHz/2 => 4.8MHz)
	ADCSRA = (1 << ADEN) | (0 << ADPS2) | (0 << ADPS1) | (0 << ADPS0);

/*
	// Clear ADC Interrupt Flag
	ADCSRA |= (uint8_t) (1 << ADIF);
	// Begin ADC Conversion
	ADCSRA |= (uint8_t) (1 << ADSC);

	// Wait while ADC Interrupt Flag not set
	while(!(ADCSRA & (1 << ADIF)));

	uint8_t garbage = ADCH;
*/
	ADC_poll();
#else
	// Set PB3 output (BUZZER output enabled)
	DDRB |= (1<<PIN3);
	// Set PB3 low (BUZZER OFF)
	PORTB &= ~(1<<PIN3);
#endif

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Set I2C event functions
	usi_onReceiverPtr = I2C_Rx_Event;
	usi_onRequestPtr = I2C_Rq_Event;

	// Set device address (use some default in setup() config?)
	usiTwiSlaveInit(x00_table[3]);
}



void loop()
{
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Simple Digital Mode
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if (I2C_ENABLED==0)
	{
		// Set data pin to be Input with Pull-Up
		DATA_IN();

		while(1)
		{
			// If DATA Input == high
			if (DATA_CHK())
			{
				// Check if FSR below threshold (5V:PUR:ADC:FSR:GND)
					// (20k~50k internal pull-up) (10k external pull-up)
/*
				// Clear ADC Interrupt Flag
				ADCSRA |= (uint8_t) (1 << ADIF);
				// Begin ADC Conversion
				ADCSRA |= (uint8_t) (1 << ADSC);

				// Wait while ADC Interrupt Flag not set
				while(!(ADCSRA & (1 << ADIF)));
*/
				// Rolling average to cut down on noise
//				fsr = ((fsr + ADCH)>>1);
				fsr = ((fsr + ADC_poll())>>1);

				// Increment a consecutive 'hit' counter to cut down on noise
				if (fsr < conti_table[2])
				{
					hit_detect++;
				}
				else
				{
					hit_detect = 0;
				}
			
				// If possible 'hits' > threshold, really did get hit
				if (hit_detect > conti_table[3])
				{
					// Tell transponder we got hit
					DATA_HIT();

					// Flash all LEDs together at 10 Hz
					uint8_t count=0;
					while (count<10)
					{
						LED1_ON(); LED2_ON();
						safe_sleep(50);

						LED1_OFF(); LED2_OFF();
						safe_sleep(50);

						// Release DATA line
						if (count == ID)
							DATA_IN();

						count++;
					}
					// Turn LEDs off and return to checking FSRs and DATA
					LED1_OFF(); LED2_OFF();
				}
			}
			// If DATA Input == low
			if (!DATA_CHK())
			{
				// Flash LEDs at 5 Hz in alternating pattern
				while (1)//!DATA_CHK)
				{
					LED1_ON(); LED2_OFF();
					safe_sleep(100);
					if (DATA_CHK())
						break;

					LED1_OFF(); LED2_ON();
					safe_sleep(100);
					if (DATA_CHK())
						break;
				}
				// Turn LEDs off and return to checking FSRs and DATA
				LED1_OFF(); LED2_OFF();
			}
		}
	}

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// I2C Slave Mode
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Create some variables
	uint16_t fsr = 255;
	uint8_t hit_detect = 0;
	uint16_t damage = 0;

// Set device address
	usiTwiSlaveInit(x00_table[3]);

	while(1)
	{
		// Rolling average to cut down on noise
		fsr = ((fsr + ADC_poll())>>1);

		// Increment a consecutive 'hit' counter to cut down on noise
		if (fsr < x30_table[0])
		{
			hit_detect++;
		}
		else
		{
			hit_detect = 0;
		}
	
		// If possible 'hits' > threshold, probably did get hit
		if (hit_detect > x30_table[1])
		{
			// Let transponder know we got hit and compute new damage count
			x10_table[0] |= IM_HIT;
			damage += x20_table[4];
			x10_table[1] = (damage>>0)&0xFF;
			x10_table[2] = (damage>>8)&0xFF;
		}


		if (x40_table[0] & FORCE_ACTIVE)
		{
			control_leds(x40_table[0]);
		}
		else if (x10_table[0] & IM_HIT)
		{
			control_leds(x40_table[1]);
		}
		else if (x10_table[0] & OTHER_HIT)
		{
			control_leds(x40_table[2]);
		}
		else if (x10_table[0] & HAVE_FLAG)
		{
			control_leds(x40_table[3]);
		}
		else if (x10_table[0] & AM_CAPTURING)
		{
			control_leds(x40_table[4]);
		}

	}	// while(1)

}	// loop()



void control_leds(uint8_t state)
{
	uint8_t rate = state&0x07;
	uint8_t seq = state&0x70;

// handle actual LED switching in ISR(TIMER0_OVF_vect)
	if (seq == LEDS_ALTERNATING)
	{
	}

	if (rate == FREQ_00_000Hz)
	{
	}
}



uint8_t ADC_poll(void)
{
	// Clear ADC Interrupt Flag
	ADCSRA |= (uint8_t) (1 << ADIF);
	// Begin ADC Conversion
	ADCSRA |= (uint8_t) (1 << ADSC);

	// Wait while ADC Interrupt Flag not set
	while(!(ADCSRA & (1 << ADIF)));

	uint8_t grabber = ADCH;
	return grabber;
}


///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void I2C_Stop_Check(void)
{
	if (!usi_onReceiverPtr)
	{
		// no onReceive callback, nothing to do...
		return;
	}
	if (!(USISR & ( 1 << USIPF )))
	{
		// Stop not detected
		return;
	}
	uint8_t nBytes = usiTwiAmountDataInReceiveBuffer();
	if (nBytes == 0)
	{
		// no data in buffer
		return;
	}
	usi_onReceiverPtr(nBytes);
}
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void I2C_Rx_Event(uint8_t nBytes)
{
	if (nBytes < 1)
		return;
	if (nBytes > TWI_RX_BUFFER_SIZE)
		return;

	// Get write address
	reg_addr = usiTwiReceiveByte();

	nBytes--;
	while(nBytes--)
	{
		// No roll-over
		if ( reg_addr < (0x00+x00_table_size) )
		{
			// Save new ID to table
			if (reg_addr == 0x03)
				x00_table[3] = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < 0x20 )
		{
			// Discard excess data
			uint8_t more_garbage = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < (0x20+x20_table_size) )
		{
			// Save new HIT values to table
			x20_table[(reg_addr&0x0F)] = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < 0x30 )
		{
			// Discard excess data
			uint8_t more_garbage = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < (0x30+x30_table_size) )
		{
			// Save new FSR values to table
			x30_table[(reg_addr&0x0F)] = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < 0x40 )
		{
			// Discard excess data
			uint8_t more_garbage = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < (0x40+x40_table_size) )
		{
			// Save new LED values to table
			x40_table[(reg_addr&0x0F)] = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < 0x50 )
		{
			// Discard excess data
			uint8_t more_garbage = usiTwiReceiveByte();
			reg_addr++;
		}
/*		
		else if ( reg_addr < (0x50+x50_table_size) )
		{
			// Save new BUZZER values to table
			x50_table[(reg_addr&0x0F)] = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < 0x60 )
		{
			// Discard excess data
			uint8_t more_garbage = usiTwiReceiveByte();
			reg_addr++;
		}
*/
		else
		{
			// Discard excess data
			uint8_t more_garbage = usiTwiReceiveByte();
		}
	}
}
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void I2C_Rq_Event(void)
{
	// If master reading status, clear IM_HIT bit
	if (reg_addr==0x10)
	{
		x10_table[0] &= ~IM_HIT;
	}

	// Send byte at current position in table
	usiTwiTransmitByte( conti_table[conti_pos++] );
	// Increment position on each read, and loop back to zero
	if (conti_pos >= conti_size)
	{
		conti_pos = 0;
	}


	// No roll-over
	if ( reg_addr < (0x00+x00_table_size) )
	{
		usiTwiTransmitByte( x00_table[(reg_addr&0x0F)] );
		reg_addr++;
	}
	else if ( reg_addr < 0x10 )
	{
		usiTwiTransmitByte( 0x00 );
		reg_addr++;
	}
	if ( reg_addr < (0x10+x10_table_size) )
	{
		usiTwiTransmitByte( x10_table[(reg_addr&0x0F)] );
		reg_addr++;
	}
	else if ( reg_addr < 0x20 )
	{
		usiTwiTransmitByte( 0x00 );
		reg_addr++;
	}
	else if ( reg_addr < (0x20+x20_table_size) )
	{
		usiTwiTransmitByte( x20_table[(reg_addr&0x0F)] );
		reg_addr++;
	}
	else if ( reg_addr < 0x30 )
	{
		usiTwiTransmitByte( 0x00 );
		reg_addr++;
	}
	else if ( reg_addr < (0x30+x30_table_size) )
	{
		usiTwiTransmitByte( x30_table[(reg_addr&0x0F)] );
		reg_addr++;
	}
	else if ( reg_addr < 0x40 )
	{
		usiTwiTransmitByte( 0x00 );
		reg_addr++;
	}
	else if ( reg_addr < (0x40+x40_table_size) )
	{
		usiTwiTransmitByte( x40_table[(reg_addr&0x0F)] );
		reg_addr++;
	}
	else if ( reg_addr < 0x50 )
	{
		usiTwiTransmitByte( 0x00 );
		reg_addr++;
	}
/*		
	else if ( reg_addr < (0x50+x50_table_size) )
	{
		usiTwiTransmitByte( x50_table[(reg_addr&0x0F)] );
		reg_addr++;
	}
	else if ( reg_addr < 0x60 )
	{
		usiTwiTransmitByte( 0x00 );
		reg_addr++;
	}
*/
	else
	{
		usiTwiTransmitByte( 0x00 );
	}

}



///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
volatile uint32_t millis_counter = 0;
volatile uint32_t millis_countdown = 0;
volatile bool milli_snoozer = FALSE;

void stopTimer0(void)
{
	// Disable counter while configuring
	TCCR0B = 0;
	// Reset count
	TCNT0 = 0;
}

void configTimer0_millis(void)
{
	// Timer0/Counter0 - 8-bit
	stopTimer0();

	// 8.0e6/(64*125) = 1ms
	OCR0A = 124;

	// Enable OCR0A interrupt
//	TIMSK0 = (1<<OCIE0B) | (0<<OCIE0A) | (0<<TOIE0);
	// Enable OVF interrupt
	TIMSK0 = (0<<OCIE0B) | (0<<OCIE0A) | (1<<TOIE0);

	// PWM, Fast mode (TOP=OCRA)
	// Compare Output Mode (OC0A disconnected, OC0B disconnected)
	TCCR0A = (0<<COM0A1) | (0<<COM0A0) | (0<<COM0B1) | (0<<COM0B0) | (1<<WGM01) | (1<<WGM00);
	// Enable counter clock (1/64 prescaler)
	TCCR0B = (0<<FOC0A) | (0<<FOC0B) | (1<<WGM02) | (0<<CS02) | (1<<CS01) | (1<<CS00);
}

ISR(TIMER0_OVF_vect)
{
	millis_counter++;
	I2C_Stop_Check();

	if (milli_snoozer)
	{
		if (millis_countdown>0)
			millis_countdown--;
		else
			milli_snoozer = FALSE;
	}
}

uint32_t millis(void)
{
	uint32_t m;
	uint8_t sreg = SREG;
	cli();

	m = millis_counter;

	SREG = sreg;

	return m;
}

void safe_sleep(uint32_t snooze_ms)
{
	millis_countdown = snooze_ms;
	milli_snoozer = TRUE;
	while(milli_snoozer);
}


void fsr_calibration(void)
{
/*
	Write FSR_CALIBRATION_MODE_ENABLE = 1
		(LED1 on; LED2 flashing at ~5Hz)
		Shoot target panel as many times as desired.
			Board will save 20 biggest impacts
	Write FSR_CALIBRATION_MODE_ENABLE = 0
	Test out new value
	Write to EEPROM?
*/
	uint8_t iter=0;
	uint8_t big_hits[20] = {255};
	uint8_t hit_now = 0;
	uint8_t hit_last = 0;

	control_led( (LEDS_CH1S_CH2F | FREQ_05_000Hz) );
	while( x30_table[2] == 1 )
	{
		hit_now = ADC_poll();

		// BB still increasingly compressing FSR
		if (hit_now < hit_last)
		{
			hit_last = hit_now;
		}
		// BB rebounding or button pressed
		else
		{
			// Add hit_last to list of BB-hit values
			for (iter=0; iter<20; iter++)
			{
				if (hit_last < big_hits[iter])
				{
					big_hits[iter] = hit_last;
					break;
				}
			}
		}
		safe_sleep(1);
	}


	uint32_t tempThreshold=0;
	for (iter=0; iter<20; iter++)
	{
		tempThreshold += big_hits[iter];
	}
	tempThreshold = (tempThreshold/20)+10;
	if ( (tempThreshold < 250) && (tempThreshold > 50) )
	{
		x30_table[1] = (uint8_t) tempThreshold;
	}
	else
	{
		while(1)
		{
			LED1_ON(); LED2_OFF;
			safe_sleep(25);
			LED1_OFF(); LED2_ON;
			safe_sleep(25);
			
		}
	}
}

void grabFromEEPROM(void)
{
// Create some variables
	uint8_t tempByte = 0;

// Grab defaults from EEPROM
	x00_table[0] = eeprom_read_byte(&eep_model);
	x00_table[1] = eeprom_read_byte(&eep_vhard);
	x00_table[2] = eeprom_read_byte(&eep_vfirm);
	tempByte = eeprom_read_byte(&eep_idOffset);
	x00_table[3] = tempByte + YETIS_MIN_ID_LTB;

	x10_table[0] = 0;
	x10_table[1] = 0;
	x10_table[2] = 0;

	x20_table[0] = eeprom_read_byte(&eep_hit_durationL);
	x20_table[1] = eeprom_read_byte(&eep_hit_durationH);
	x20_table[2] = eeprom_read_byte(&eep_hit_standoffL);
	x20_table[3] = eeprom_read_byte(&eep_hit_standoffH);
	x20_table[4] = eeprom_read_byte(&eep_dph_value);

	x30_table[0] = eeprom_read_byte(&eep_fsr_sdph);
	x30_table[1] = eeprom_read_byte(&eep_fsr_threshold);
	x30_table[2] = 0;

	x40_table[0] = eeprom_read_byte(&eep_leds_hit);
	x40_table[1] = eeprom_read_byte(&eep_leds_flag);
	x40_table[2] = eeprom_read_byte(&eep_leds_cap);
	x40_table[3] = 0;

/*
	x50_table[0] = eeprom_read_byte(&eep_buzz_hit);
	x50_table[1] = eeprom_read_byte(&eep_buzz_flag);
	x50_table[2] = eeprom_read_byte(&eep_buzz_cap);
	x50_table[3] = 0;
*/
}

void saveToEEPROM(void)
{
// Create some variables
	uint8_t tempByte = 0;

// Save tables to EEPROM
	tempByte = x00_table[3] - YETIS_MIN_ID_LTB;
	eeprom_write_byte(&eep_idOffset, tempByte);

	eeprom_write_byte(&eep_hit_durationL, x20_table[0]);
	eeprom_write_byte(&eep_hit_durationH, x20_table[1]);
	eeprom_write_byte(&eep_hit_standoffL, x20_table[2]);
	eeprom_write_byte(&eep_hit_standoffH, x20_table[3]);
	eeprom_write_byte(&eep_dph_value, x20_table[4]);

	eeprom_write_byte(&eep_fsr_sdph, x30_table[0]);
	eeprom_write_byte(&eep_fsr_threshold, x30_table[1]);

	eeprom_write_byte(&eep_leds_hit, x40_table[0]);
	eeprom_write_byte(&eep_leds_flag, x40_table[1]);
	eeprom_write_byte(&eep_leds_cap, x40_table[2]);

/*
	eeprom_write_byte(&eep_buzz_hit, x50_table[0]);
	eeprom_write_byte(&eep_buzz_flag, x50_table[1]);
	eeprom_write_byte(&eep_buzz_cap, x50_table[2]);
*/
}

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int main(void)
{
	configTimer0_millis();
	setup();
	
	while(1)
	{
		loop();
	}
}
