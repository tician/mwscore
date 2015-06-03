/*
 *******************************************************************************
 *  Copyright (c) 2012, 2013, 2014 Matthew Paulishen. All rights reserved.
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

// sudo avrdude -c usbasp -P USB -p t13 -v -U flash:w:./mw_itb_dig.hex


#include <stdint.h>
#include <stdio.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/eeprom.h>

#if defined(__ATtiny13A__)
#define I2C_ENABLED		0

#elif defined(__ATtiny25__) | defined(__ATtiny45__) | defined(__ATtiny85__)
#define I2C_ENABLED		1
#include "usiTwiSlave.h"

#else
#error 'INVALID DEVICE'
#endif

/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// PIN DEFINITIONS
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	PB0 - I/O - SDA												DIP-P5	MOSI
	PB1 - OUT - LED2 -	Pin : 62[Ohm] : [>] : [>] : GND			DIP-P6	MISO
	PB2 - I/O - DATA/SCL										DIP-P7	SCK
	PB3 - ADC - BUTTON/SENSE (ADC3)								DIP-P2
	PB4 - OUT - LED1 -	Pin : 62[Ohm] : [>] : [>] : GND			DIP-P3
	PB5 - N/A - RESET											DIP-P1	!RESET
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
#define LED1_OFF()	{PORTB &=~(1<<PIN4);}
#define LED1_ON()	{PORTB |= (1<<PIN4);}
#define LED2_OFF()	{PORTB &=~(1<<PIN1);}
#define LED2_ON()	{PORTB |= (1<<PIN1);}
#define DATA_IN()	{DDRB &= ~(1<<PIN2); PORTB |= (1<<PIN2);}
#define DATA_CHK()	{(PINB&(1<<PIN2));}
#define DATA_HIT()	{DDRB |= (1<<PIN2); PORTB &= ~(1<<PIN2);}


/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Universal functionality
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
All FSRs are connected in parallel to SENSE/ADC3 with a 10k external pull-up
Pull RESET low to reboot at any time; will clear all settings not saved to EEPROM.
Pull SENSE low for ~5 seconds during reset/boot to enter configuration mode.

  Configuration Mode (LED1 flashing ~5Hz until SENSE released):
    To set ID, pull SENSE low N times until LED1 on, LED2 off.
    To set Threshold, pull SENSE low N times until LED1 off, LED2 on.
    To set SDPH, pull SENSE low N times until LED1 on, LED2 on.
    Wait ~3 seconds until board enters selected mode.


    Set 'ID' (LED1 off; LED2 pulsing on 1~12 times, then off 1s):
      When LED2 pulses N==ID, pull SENSE low until LED1 on and LED2 off
      Release SENSE and LED1 will pulse the newly set ID with LED2 on solid
      LED2 flashing and LED1 on solid for 5s
        If pull SENSE low ~1s, LED1 off and new ID will be saved to EEPROM

    Set 'Sequential Detections Per Hit' (LED1 on; LED2 pulsing on 1~12 times, then off 1s):
      When LED2 pulses N==SDPH, pull SENSE low until LED1 off and LED2 on
      Release SENSE and LED1 will pulse the newly set SDPH with LED2 on solid
      LED2 flashing and LED1 on solid for 5s
        If pull SENSE low ~1s, LED1 off and new SDPH will be saved to EEPROM


    Set 'Detection Threshold' (LED1 on; LED2 flashing at ~5HZ)
      Shoot target panel as many times as desired.
      Board will save 20 biggest impacts
      Pull SENSE low for ~2s to find arithmetic mean of those 20 hits,
        then set Threshold to (arithmetic mean + 10) and save to EEPROM.
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/


/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// No USI for I2C
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DATA is input most of the time.
  If Transponder wants panel active, lets DATA stay pulled high by pull-up
    If DATA is Input and pulled high by pull-up, check FSRs for hits
  If Transponder wants panel flashing, pulls DATA low
    If DATA is Input and pulled low by transponder, start flashing LEDs
  If detect hit, panel pulls DATA low for (ID*0.1)[s] and flashes LEDs for ~1s
    and refuses to register new hits until LEDs stop flashing (1 hp/second)
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
#define BASE_PANEL_ID	0x42

uint8_t EEMEM eep_myID = 0;
uint8_t EEMEM eep_fsr_sdph = 5;	// Sequential ADC Detections Per Hit
uint8_t EEMEM eep_fsr_threshold = 230;	// ADC Threshold for Detection

volatile uint8_t conti_table[] =
{
	0x00,	// Status register
				// Bit-0: (R-) IM_HIT (cleared when READ by master)
				// Bit-1: (-W) OTHER_HIT
				// Bit-2: (-W) HAVE_FLAG
				// Bit-3: (RW) RESERVED for future use
				
				// Bit-4: (-W) Save current ID to EEPROM
				// Bit-5: (-W) Save current FSR_SDPH to EEPROM
				// Bit-6: (-W) Save current FSR_THR to EEPROM
				// Bit-7: (-W) RESET (to EEPROM defaults using WDReset)

// Default values grabbed from EEPROM at boot
	0x00,	// ID register (RW) (1~12)
	0x00,	// FSR Sequential Detections Per Hit register (RW) (1~50)
	0x00	// FSR Threshold register (RW) (50~250)
};

const uint8_t conti_size = sizeof(conti_table);
// Tracks the current register pointer position
volatile uint8_t conti_pos;
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
// Create some variables
	uint16_t fsr = 255;
	uint8_t hit_detect = 0;

// Grab defaults from EEPROM
	conti_table[1] = eeprom_read_byte(&eep_myID);
	conti_table[2] = eeprom_read_byte(&eep_fsr_sdph);
	conti_table[3] = eeprom_read_byte(&eep_fsr_threshold);

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

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if (I2C_ENABLED==1)
	{
		// Set I2C event functions
		usi_onReceiverPtr = I2C_Rx_Event;
		usi_onRequestPtr = I2C_Rq_Event;

		// Set device address to 0x42 while in configuration mode
		usiTwiSlaveInit(BASE_PANEL_ID);
	}

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Configuration Mode
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	uint8_t count = 0;
// Check for SENSE line pulled low for 5 seconds
	while(count<200)
	{
		safe_sleep(25);
		if(ADC_poll() > 50)
			return;
		count++;
	}
// Successfully entered Configuration mode (flash LED1 until SENSE released)
	while(ADC_poll() < 50)
	{
		LED1_ON();
		safe_sleep(100);
		LED1_OFF();
		safe_sleep(100);
	}
// Select which setting to change
	while(1)
	{
		count = 0;
		uint8_t modus = 0;
		LED1_OFF(); LED2_OFF();

// Display mode setting and use a 3 second timeout.
		while(count<120)
		{
			// ID (LED1 on, LED2 off)
			if (modus==1)
			{
				LED1_ON(); LED2_OFF();
			}

			// SDPH (LED1 off, LED2 on)
			if (modus==2)
			{
				LED1_OFF(); LED2_ON();
			}

			// DTHR (LED1 on, LED2 on)
			if (modus==3)
			{
				LED1_ON(); LED2_ON();
			}

			// SENSE pulled low
			if (ADC_poll()<50)
			{
				modus++;
				if (modus>3)
					modus = 0;
				safe_sleep(500);
				count=0;
			}
			else
			{
				count++;
				safe_sleep(25);
			}
		}


/*
    Set 'ID' (LED1 off; LED2 pulsing on 1~12 times, then off 1s):
      When LED2 pulses N==ID, pull SENSE low until LED1 on and LED2 off
      Release SENSE and LED1 will pulse the newly set ID with LED2 on solid
      LED2 flashing and LED1 on solid for 5s
        If pull SENSE low ~1s, LED1 off and new ID will be saved to EEPROM
*/
		if (modus==1)
		{
			LED1_OFF(); LED2_OFF();
			uint8_t iter=0, tempID=0;

			while(1)
			{
				tempID++;
				for (iter=0; iter<tempID; iter++)
				{
					LED2_ON();
					safe_sleep(500);
					LED2_OFF();
					safe_sleep(500);
				}

				safe_sleep(1000);
				if (ADC_poll() < 50)
				{
					break;
				}

				if (tempID > 12)
					tempID=0;
			}

			conti_table[1] = tempID;
			LED1_ON(); LED2_OFF();
			while(ADC_poll() < 50)
			{
				safe_sleep(25);
			}
			LED1_OFF(); LED2_ON();

			for (iter=0; iter<conti_table[1]; iter++)
			{
				LED1_ON();
				safe_sleep(500);
				LED1_OFF();
				safe_sleep(500);
			}

			count = 0;
			uint8_t sense_count = 0;
			LED1_ON(); LED2_OFF();
			while(count<200)
			{
				if (count&0x01)
					LED2_ON();
				else
					LED2_OFF();

				count++;
				safe_sleep(25);

				if(ADC_poll() < 50)
					sense_count++;
				else
					sense_count=0;

				if (sense_count>40)
				{
					LED1_OFF();
					eeprom_write_byte(&eep_myID, conti_table[1]);
					break;
				}
			}


		}

/*
    Set 'Sequential Detections Per Hit' (LED1 on; LED2 pulsing on 1~12 times, then off 1s):
      When LED2 pulses N==SDPH, pull SENSE low until LED1 off and LED2 on
      Release SENSE and LED1 will pulse the newly set SDPH with LED2 on solid
      LED2 flashing and LED1 on solid for 5s
        If pull SENSE low ~1s, LED1 off and new SDPH will be saved to EEPROM
*/
		else if (modus==2)
		{




			count = 0;
			uint8_t sense_count = 0;
			LED1_ON(); LED2_OFF();
			while(count<200)
			{
				if (count&0x01)
					LED2_ON();
				else
					LED2_OFF();

				count++;
				safe_sleep(25);

				if(ADC_poll() < 50)
					sense_count++;
				else
					sense_count=0;

				if (sense_count>40)
				{
					LED1_OFF();
					eeprom_write_byte(&eep_fsr_sdph, conti_table[2]);
					break;
				}
			}
	
		}

/*
    Set 'Detection Threshold' (LED1 on; LED2 flashing at ~5HZ)
      Shoot target panel as many times as desired.
      Board will save 20 biggest impacts
      Pull SENSE low for ~2s to find arithmetic mean of those 20 hits,
        then set Threshold to (arithmetic mean + 10) and save to EEPROM.

*/
		else if (modus==3)
		{
			uint8_t sense_count = 0; count = 0;
			uint8_t iter=0;
			uint8_t big_hits[20] = {255};
			uint8_t hit_now = 0;
			uint8_t hit_last = 0;

			LED1_ON(); LED2_OFF();
			while(1)
			{
				hit_now = ADC_poll();

				// BB still increasingly compressing FSR
				if (hit_now < hit_last)
					hit_last = hit_now;
				// BB rebounding or button pressed
				else
				{
					if (hit_last > 50)
					{
						sense_count = 0;
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
					else
					{
						sense_count++;
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
				conti_table[3] = tempThreshold;
				eeprom_write_byte(&eep_fsr_threshold, conti_table[3]);
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
		else
			break;
	}

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
	if (I2C_ENABLED==1)
	{
		// Set device address to Panel number plus 0x42
		usiTwiSlaveInit(conti_table[1]+BASE_PANEL_ID);

		while(1)
		{
			
		}
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
	conti_pos = usiTwiReceiveByte();

	nBytes--;
	while(nBytes--)
	{
		// No roll-over
		if (conti_pos < conti_size)
		{
			// Save to table
			conti_table[conti_pos++] = usiTwiReceiveByte();
		}
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
	if (conti_pos==0)
	{
		conti_table[0] &= ~(1<<0);
	}

	// Send byte at current position in table
	usiTwiTransmitByte( conti_table[conti_pos++] );
	// Increment position on each read, and loop back to zero
	if (conti_pos >= conti_size)
	{
		conti_pos = 0;
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

#if defined(__ATtiny13__)
	// 9.6e6/(64*150) = 1ms
	OCR0A = 149;
#else
	// 8.0e6/(64*125) = 1ms
	OCR0A = 124;
#endif

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

#if defined(__ATtiny13__)
ISR(TIM0_OVF_vect)
#else
ISR(TIMER0_OVF_vect)
#endif
{
	millis_counter++;
#if defined(I2C_ENABLED==1)
	I2C_Stop_Check();
#endif
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
