/*
 *******************************************************************************
 * YETIS ATtiny45/85 I2C Device - Lights and Target Board
 *******************************************************************************
 * Copyright (c) 2015, Matthew Paulishen.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the <organization> nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *******************************************************************************
 */


// sudo avrdude -c usbasp -P USB -p t85 -v -U flash:w:./yetis_itb_v0.hex

#include <stdint.h>
#include <stdio.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>

#if defined(__AVR_ATtiny45__) | defined(__AVR_ATtiny85__)
#include "usiTwiSlave.h"
#include "yetis_i2c_devs.hpp"
using namespace mechwarfare;

#else
#error 'INVALID DEVICE'
#endif


#ifndef YETIS_MODEL
#define YETIS_MODEL					yetisI2Cdevs::YETIS_MODEL_LTB
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
	PB1 - OUT - LED2 -	Pin : 62[Ohm] : [>] : [>] : GND			DIP-P6	MISO	OC1A
	PB2 - I/O - SCL												DIP-P7	SCK
	PB3 - ADC - BUTTON/SENSE (ADC3)								DIP-P2
	PB4 - OUT - LED1 -	Pin : 62[Ohm] : [>] : [>] : GND			DIP-P3			OC1B
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
uint8_t EEMEM eep_idOffset = 2;	// Offset from model's minimum ID

uint8_t EEMEM eep_hit_durationL = (1000>>0)&0xFF;	// [ms]
uint8_t EEMEM eep_hit_durationH = (1000>>8)&0xFF;	// [ms]
uint8_t EEMEM eep_hit_standoffL = (1000>>0)&0xFF;	// [ms]
uint8_t EEMEM eep_hit_standoffH = (1000>>8)&0xFF;	// [ms]
uint8_t EEMEM eep_dph_value = 1;	// [damage per hit]

uint8_t EEMEM eep_fsr_sdph = 5;	// Sequential ADC Detections Per Hit
uint8_t EEMEM eep_fsr_threshold = 60;	// ADC Threshold for Detection

uint8_t EEMEM eep_leds_im_hit = (yetisI2Cdevs::LEDS_ALTERNATING | yetisI2Cdevs::FREQ_8_000Hz);
uint8_t EEMEM eep_leds_other_hit = (yetisI2Cdevs::LEDS_SYNCHRONOUS | yetisI2Cdevs::FREQ_8_000Hz);
uint8_t EEMEM eep_leds_flag = (yetisI2Cdevs::LEDS_SYNCHRONOUS | yetisI2Cdevs::FREQ_4_000Hz);
uint8_t EEMEM eep_leds_cap = (yetisI2Cdevs::LEDS_FLOWING | yetisI2Cdevs::FREQ_4_000Hz);

/*
uint8_t EEMEM eep_buzz_hit = (yetisI2Cdevs::BUZZ_WARBLE | yetisI2Cdevs::FREQ_2_000Hz);
uint8_t EEMEM eep_buzz_flag = (yetisI2Cdevs::BUZZ_BEEP_HIGH | yetisI2Cdevs::FREQ_4_000Hz);
uint8_t EEMEM eep_buzz_cap = (yetisI2Cdevs::BUZZ_RISING | yetisI2Cdevs::FREQ_1_000Hz);
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
				000	FREQ_8_000Hz
				001	FREQ_4_000Hz
				010	FREQ_2_000Hz
				011	FREQ_1_000Hz
				100	FREQ_0_500Hz
				101	FREQ_0_250Hz
				110	FREQ_0_125Hz
				111	FREQ_0_000Hz
		SSS
				000 NONE
				001	ALTERNATING
				010	SYNCHRONOUS
				011	FLOWING (NONE, CH1, CH1+CH2, CH2, NONE)
				100	CH1_ONLY
				101	CH2_ONLY
				110	CH1_SOLID + CH2_FLASHING
				111	CH1_FLASHING + CH2_SOLID

*/
volatile uint8_t x40_table[] =
{			// ADDR: NAME
	0x00,	// 0x40: LED State							(RW) (0x00~0xFF)
	0x00,	// 0x41: LED IM_HIT Value					(RW) (0x00~0xFF)
	0x00,	// 0x42: LED OTHER_HIT Value				(RW) (0x00~0xFF)
	0x00,	// 0x43: LED HAVE_FLAG Value				(RW) (0x00~0xFF)
	0x00	// 0x44: LED AM_CAPTURING Value				(RW) (0x00~0xFF)
};
const uint8_t x40_table_size = sizeof(x40_table);

/*
	BUZZER: xSSS FRRR
		F
				1	FORCE_ACTIVE
		RRR
				000	FREQ_8_000Hz
				001	FREQ_4_000Hz
				010	FREQ_2_000Hz
				011	FREQ_1_000Hz
				100	FREQ_0_500Hz
				101	FREQ_0_250Hz
				110	FREQ_0_125Hz
				111	FREQ_0_000Hz
		SSS
				000 NONE
				001	BEEP_LOW
				010	BEEP_MID
				011	BEEP_HIGH
				100	WARBLE
				101	WAHWAHWAH
				110	RISING
				111	FALLING
*/
/*
volatile uint8_t x50_table[] =
{			// ADDR: NAME
	0x00,	// 0x50: Buzzer State						(RW) (0x00~0xFF)
	0x00,	// 0x51: Buzzer IM_HIT Value				(RW) (0x00~0xFF)
	0x00,	// 0x52: Buzzer OTHER_HIT Value				(RW) (0x00~0xFF)
	0x00,	// 0x53: Buzzer HAVE_FLAG Value				(RW) (0x00~0xFF)
	0x00	// 0x54: Buzzer AM_CAPTURING Value			(RW) (0x00~0xFF)
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
volatile uint8_t reg_addr = 0x00;

void setup();
void loop();

uint8_t ADC_poll(void);

void I2C_Stop_Check(void);
void I2C_Rx_Event(uint8_t nBytes);
void I2C_Rq_Event(void);


volatile uint16_t millis_im_hit = 0;
volatile uint16_t millis_standoff = 0;
volatile uint16_t millis_other_hit = 0;
void stopTimer0(void);
void configTimer0_millis(void);
uint32_t millis(void);
void safe_sleep(uint32_t snooze_ms);

void stopTimer1(void);
void configTimer1(void);
void update_leds(void);

void fsr_calibration(void);
void grabFromEEPROM(void);
void saveToEEPROM(void);
void wdtReboot(void);






void setup()
{
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	grabFromEEPROM();

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Set PB4 and PB1 output (LED outputs enabled)
	DDRB = (1<<PIN1) | (1<<PIN4);
	// Set PB4 and PB1 low (LEDs OFF)
	PORTB &= ~((1<<PIN1) | (1<<PIN4));
	// Disable PB3/ADC3 pull-up (use 10k external pull-up)
	PORTB &= ~(1<<PIN3);

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// ADC Setup for normal usage
	// Use Vcc as reference, Left Adjust Result, Select ADC3
	ADMUX = (0 << REFS1) | (0 << REFS0) | (1 << ADLAR) | (0 << REFS2) | (0 << MUX3) | (0 << MUX2) | (1 << MUX1) | (1 << MUX0);
	// Power saving by disable digital input buffer for dedicated ADC pin
	DIDR0 = (1 << ADC3D);
	// ADC Enable, Clock 1/2 div. (8MHz/2 => 4MHz)
	ADCSRA = (1 << ADEN) | (0<<ADSC) | (0<<ADATE) | (0<<ADIF) | (0<<ADIE) | (0 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
	// Unipolar mode, no input polarity reversal, Free Running mode
	ADCSRB = (0<<BIN) | (0<<IPR) | (0<<ADTS2) | (0<<ADTS1) | (0<<ADTS0);	

	ADC_poll();
/*
	// Set PB3 output (BUZZER output enabled)
	DDRB |= (1<<PIN3);
	// Set PB3 low (BUZZER OFF)
	PORTB &= ~(1<<PIN3);
*/

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Set I2C event functions
	usi_onReceiverPtr = I2C_Rx_Event;
	usi_onRequestPtr = I2C_Rq_Event;

	// Set device address (use some default in setup() config?)
	usiTwiSlaveInit(0x7F);
	safe_sleep(2000);
}



void loop()
{
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// I2C Slave Mode
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Set device address (use some default in setup() config?)
	usiTwiSlaveInit(x00_table[3]);
// Create some variables
	uint16_t fsr = 255;
	uint8_t hit_detect = 0;
	uint16_t damage = 0;

	while(1)
	{
		if (millis_standoff == 0)
		{
			// Rolling average to cut down on noise
			fsr = ((fsr + ADC_poll())>>1);

			// Increment a consecutive 'hit' counter to cut down on noise
			if (fsr < x30_table[1])
			{
				hit_detect++;
			}
			else
			{
				hit_detect = 0;
			}

			// If possible 'hits' > sdph, probably did get hit
			if (hit_detect > x30_table[0])
			{
				uint8_t sreg = SREG;
				cli();
				// Let transponder know we got hit and compute new damage count
				x10_table[0] |= yetisI2Cdevs::IM_HIT;
				damage += x20_table[4];

				x10_table[1] = (damage>>0)&0xFF;
				x10_table[2] = (damage>>8)&0xFF;

				millis_im_hit = (x20_table[0]<<0) + (x20_table[1]<<8) + 1;
				millis_standoff = (x20_table[2]<<0) + (x20_table[3]<<8);
				SREG = sreg;

				hit_detect = 0;
				update_leds();
			}
		}
		I2C_Stop_Check();
	}	// while(1)

}	// loop()







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

	uint8_t sreg = SREG;
	cli();
	// Get write address
	reg_addr = usiTwiReceiveByte();
	uint8_t more_garbage = 0;
	nBytes--;
	while(nBytes--)
	{
		// No roll-over
		if ( reg_addr < (0x00+x00_table_size) )
		{
			more_garbage = usiTwiReceiveByte();
			// Save new ID to table
			if (reg_addr == 0x03)
				x00_table[3] = more_garbage;
			reg_addr++;
		}
		else if ( reg_addr < 0x10 )
		{
			// Discard excess data
			more_garbage = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < (0x10+1) )//x10_table_size) )
		{
			more_garbage = usiTwiReceiveByte();
			reg_addr++;

			if ( more_garbage & (yetisI2Cdevs::SAVE_TO_EEPROM) )
			{
				saveToEEPROM();
			}
			if ( more_garbage & (yetisI2Cdevs::REBOOT) )
			{
				//wdtReboot();
			}
			more_garbage &= ( (yetisI2Cdevs::OTHER_HIT) | (yetisI2Cdevs::HAVE_FLAG) | (yetisI2Cdevs::AM_CAPTURING) );

			if ( more_garbage & (yetisI2Cdevs::OTHER_HIT) )
			{
				millis_other_hit = (x20_table[0]<<0) + (x20_table[1]<<8) + 1;
				// actual change in LED sequence may be occurring
//				if ( !( x10_table[0] & (yetisI2Cdevs::OTHER_HIT) ) )
//				{
					update_leds();
//				}
			}
			// actual change in LED sequence may be occurring
			if ( (more_garbage & (yetisI2Cdevs::HAVE_FLAG) ) != (x10_table[0] & (yetisI2Cdevs::HAVE_FLAG) ) )
			{
				update_leds();
			}
			// actual change in LED sequence may be occurring
			if ( (more_garbage & (yetisI2Cdevs::AM_CAPTURING) ) != (x10_table[0] & (yetisI2Cdevs::AM_CAPTURING) ) )
			{
				update_leds();
			}

			x10_table[0] &= yetisI2Cdevs::IM_HIT;
			x10_table[0] |= more_garbage;
		}
		else if ( reg_addr < 0x20 )
		{
			// Discard excess data
			more_garbage = usiTwiReceiveByte();
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
			more_garbage = usiTwiReceiveByte();
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
			more_garbage = usiTwiReceiveByte();
			reg_addr++;
		}
		else if ( reg_addr < (0x40+x40_table_size) )
		{
			// Save new LED values to table
			x40_table[(reg_addr&0x0F)] = usiTwiReceiveByte();
			if (reg_addr==0x40)
			{
				update_leds();
			}
			reg_addr++;
		}
		else if ( reg_addr < 0x50 )
		{
			// Discard excess data
			more_garbage = usiTwiReceiveByte();
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
			more_garbage = usiTwiReceiveByte();
			reg_addr++;
		}
*/
		else
		{
			// Discard excess data
			more_garbage = usiTwiReceiveByte();
		}
	}
	SREG = sreg;
}
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void I2C_Rq_Event(void)
{
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
		// If master reading status, clear IM_HIT bit
		if (reg_addr==0x10)
		{
			x10_table[0] &= ~(yetisI2Cdevs::IM_HIT);
		}
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
volatile bool milli_snoozer = false;

void stopTimer0(void)
{
	GTCCR |= (1<<TSM);
	// Disable counter while configuring
	TCCR0A = 0;
	TCCR0B = 0;
	// Reset count
	TCNT0 = 0;
}

void configTimer0_millis(void)
{
	// Timer0/Counter0 - 8-bit
	stopTimer0();

	// 8.0e6/(64*125) = 1ms
//	OCR0A = 124;
	OCR0A = 125;

	// Enable OVF interrupt
	TIMSK &= ~( (1<<OCIE0B) | (1<<OCIE0A) );
	TIMSK |= (1<<TOIE0);

	// PWM, Fast mode (TOP=OCRA)
	// Compare Output Mode (OC0A disconnected, OC0B disconnected)
	TCCR0A = (0<<COM0A1) | (0<<COM0A0) | (0<<COM0B1) | (0<<COM0B0) | (1<<WGM01) | (1<<WGM00);
	// Enable counter clock (1/64 prescaler)
	TCCR0B = (0<<FOC0A) | (0<<FOC0B) | (1<<WGM02) | (0<<CS02) | (1<<CS01) | (1<<CS00);

	GTCCR &= ~(1<<TSM);
}

ISR(TIMER0_OVF_vect)
{
//	uint8_t sreg = SREG;
//	cli();

	millis_counter++;
	I2C_Stop_Check();

	if (milli_snoozer)
	{
		if (millis_countdown>0)
			millis_countdown--;
		else
			milli_snoozer = false;
	}

	if (millis_standoff>0)
	{
		millis_standoff--;
	}

	if (millis_im_hit>0)
	{
		if (millis_im_hit==1)
		{
			update_leds();
		}
		millis_im_hit--;
	}
	if (millis_other_hit>0)
	{
		if (millis_other_hit==1)
		{
			update_leds();
		}
		millis_other_hit--;
	}

//	SREG = sreg;
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
	milli_snoozer = true;
	while(milli_snoozer);
}



///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
volatile uint8_t leds_count = 1;
volatile uint8_t leds_top = 1;
volatile uint8_t leds_CH1_HI = 0;
volatile uint8_t leds_CH1_LO = 0;
volatile uint8_t leds_CH2_HI = 0;
volatile uint8_t leds_CH2_LO = 0;
volatile bool leds_active = false;

void stopTimer1(void)
{
	// Disable timer clock while configuring
	TCCR1 = 0;
	// Reset count
	TCNT1 = 0;
}

void configTimer1(void)
{
	// Timer1/Counter1 - 8-bit
	stopTimer1();

	// 8.0e6/(4096*122) = 16Hz
	OCR1C = 121;

	// Enable OVF interrupt
	TIMSK &= ~( (1<<OCIE1B) | (1<<OCIE1A) );
	TIMSK |= (1<<TOIE1);

	PLLCSR = 0;
	// Clear Timer/Counter on Compare Match and PWM1A for overflow at TOP: TOP=OCR1C
	// Compare Output Mode (OC1A disconnected, OC1B disconnected)
	// Enable counter clock (1/4096 prescaler)
	TCCR1 = (1<<CTC1) | (1<<PWM1A) |(0<<COM1A1) | (0<<COM1A0) | (1<<CS13) | (1<<CS12) | (0<<CS11) | (1<<CS10);
	GTCCR = (0<<PWM1B) | (0<<COM1B1) | (0<<COM1B0) | (0<<FOC1B) | (0<<FOC1A) | (0<<PSR1);
}

ISR(TIMER1_OVF_vect)
{
	if (!leds_active)
	{
		return;
	}

	if (leds_top == 0xFF)
	{
		leds_active = false;
	}

	if ( leds_count == leds_CH1_HI )
	{
		LED1_ON();
	}
	else if (leds_count == leds_CH1_LO)
	{
		LED1_OFF();
	}

	if ( leds_count == leds_CH2_HI )
	{
		LED2_ON();
	}
	else if (leds_count == leds_CH2_LO)
	{
		LED2_OFF();
	}

	if (leds_count < leds_top)
	{
		leds_count++;
	}
	else
	{
		leds_count = 0;
	}
}

void update_leds(void)
{
	uint8_t bot_state = x10_table[0];
	uint8_t led_state = x40_table[0];

	if ( !(led_state & (yetisI2Cdevs::FORCE_ACTIVE) ) )
	{
		if (millis_im_hit>1)
		{
			led_state = x40_table[1];
		}
		else if (millis_other_hit>1 )
		{
			led_state = x40_table[2];
		}
		else if (bot_state & (yetisI2Cdevs::HAVE_FLAG) )
		{
			led_state = x40_table[3];
		}
		else if (bot_state & (yetisI2Cdevs::AM_CAPTURING) )
		{
			led_state = x40_table[4];
		}
		else
		{
			led_state = 0;
		}
	}
	else
	{
		//override any other state with x40_table[0]/LED_STATE
	}

// Reset to a known state
	LED1_OFF();
	LED2_OFF();

	leds_active = false;
	leds_count = 0;
	leds_top = 0xFF;

// handle actual LED switching in ISR(TIMER1_OVF_vect)
	uint8_t rate = led_state&0x07;
	uint8_t seq = led_state&0x70;

	if (seq == yetisI2Cdevs::LEDS_NONE)
		return;

	uint8_t half_period = (1<<rate);
	if (half_period > 64)
	{
		leds_top = 0xFF;
		half_period = 0xFF;
	}
	else
	{
		leds_top = (half_period<<1);
	}

	if (seq == yetisI2Cdevs::LEDS_ALTERNATING)
	{
		leds_CH1_HI = ( 0 );
		leds_CH1_LO = ( half_period );

		leds_CH2_HI = ( half_period );
		leds_CH2_LO = ( 0 );
	}
	else if (seq == yetisI2Cdevs::LEDS_SYNCHRONOUS)
	{
		leds_CH1_HI = ( 0 );
		leds_CH1_LO = ( half_period );

		leds_CH2_HI = ( 0 );
		leds_CH2_LO = ( half_period );
	}
	else if (seq == yetisI2Cdevs::LEDS_FLOWING)
	{
		leds_CH1_HI = ( 0 );
		leds_CH1_LO = ( half_period );

		leds_CH2_HI = ( (half_period>>1) );
		leds_CH2_LO = ( (half_period>>1)+half_period );
	}
	else if (seq == yetisI2Cdevs::LEDS_CH1_ONLY)
	{
		leds_CH1_HI = ( 0 );
		leds_CH1_LO = ( half_period );

		leds_CH2_HI = ( 0xFF );
		leds_CH2_LO = ( 0 );
	}
	else if (seq == yetisI2Cdevs::LEDS_CH2_ONLY)
	{
		leds_CH1_HI = ( 0xFF );
		leds_CH1_LO = ( 0 );

		leds_CH2_HI = ( 0 );
		leds_CH2_LO = ( half_period );
	}
	else if (seq == yetisI2Cdevs::LEDS_CH1S_CH2F)
	{
		leds_CH1_HI = ( 0 );
		leds_CH1_LO = ( 0xFF );

		leds_CH2_HI = ( 0 );
		leds_CH2_LO = ( half_period );
	}
	else if (seq == yetisI2Cdevs::LEDS_CH1F_CH2S)
	{
		leds_CH1_HI = ( 0 );
		leds_CH1_LO = ( half_period );

		leds_CH2_HI = ( 0 );
		leds_CH2_LO = ( 0xFF );
	}


	leds_active = true;
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

	x40_table[0] = (yetisI2Cdevs::LEDS_CH1S_CH2F | yetisI2Cdevs::FREQ_4_000Hz | yetisI2Cdevs::FORCE_ACTIVE);
	update_leds();

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
	x40_table[0] = 0;
	update_leds();

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
			LED1_ON(); LED2_OFF();
			safe_sleep(25);
			LED1_OFF(); LED2_ON();
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
	x00_table[3] = tempByte + yetisI2Cdevs::YETIS_MIN_ID_LTB;

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

	x40_table[0] = 0;
	x40_table[1] = eeprom_read_byte(&eep_leds_im_hit);
	x40_table[1] = eeprom_read_byte(&eep_leds_other_hit);
	x40_table[3] = eeprom_read_byte(&eep_leds_flag);
	x40_table[4] = eeprom_read_byte(&eep_leds_cap);

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
	tempByte = x00_table[3] - yetisI2Cdevs::YETIS_MIN_ID_LTB;
	eeprom_write_byte(&eep_idOffset, tempByte);

	eeprom_write_byte(&eep_hit_durationL, x20_table[0]);
	eeprom_write_byte(&eep_hit_durationH, x20_table[1]);
	eeprom_write_byte(&eep_hit_standoffL, x20_table[2]);
	eeprom_write_byte(&eep_hit_standoffH, x20_table[3]);
	eeprom_write_byte(&eep_dph_value, x20_table[4]);

	eeprom_write_byte(&eep_fsr_sdph, x30_table[0]);
	eeprom_write_byte(&eep_fsr_threshold, x30_table[1]);

	eeprom_write_byte(&eep_leds_im_hit, x40_table[1]);
	eeprom_write_byte(&eep_leds_other_hit, x40_table[2]);
	eeprom_write_byte(&eep_leds_flag, x40_table[3]);
	eeprom_write_byte(&eep_leds_cap, x40_table[3]);

/*
	eeprom_write_byte(&eep_buzz_hit, x50_table[0]);
	eeprom_write_byte(&eep_buzz_flag, x50_table[1]);
	eeprom_write_byte(&eep_buzz_cap, x50_table[2]);
*/
}

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void wdtReboot(void)
{
	cli();
	wdt_enable(WDTO_250MS);
	while(1);
}
uint8_t mcusr_mirror __attribute__((section (".noinit")));
void get_mcusr(void) \
	__attribute__((naked)) \
	__attribute__((section(".init3")));
void get_mcusr(void)
{
	mcusr_mirror = MCUSR;
	MCUSR = 0;
	wdt_disable();
}
int main(void)
{
	get_mcusr();

//	wdt_enable(WDTO_250MS);
//	wdt_reset();

// Change Main Clock Divisor to 1 (8MHz)
	CLKPR = (1<<CLKPCE);
	CLKPR = 0;

	configTimer0_millis();
	configTimer1();
	sei();
	setup();

	while(1)
	{
		loop();
	}
}
