/*
	MWScore Transponder
	
	XBEE setup:
	ATBD = 5 (38400bps)
	ATID = 6200
	MY   = 6200 + TRANSPONDER_ID
	DL   = 6201
	CH   = c
	
	ATMEGA168P Fuse Setting:
	avrdude -P usb -c avrispmkII -p amega168 -F -U lfuste:w:0xce:m -U hfuse:w:0xdf:m -U efuse:w:0xf9:m

	To Program:
	> make
	> make program
*/
 
 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define TRANSPONDER_ID 43

#define XBEE_BAUDRATE 38400

#define PANEL1 2
#define PANEL2 4
#define PANEL3 8
#define PANEL4 16

#define MS_COOLDOWN 1000
#define MS_SIGNAL 50

#define LED_RATE 50
#define LED_PERIOD 300 // LED_RATE * 6

volatile uint8_t hit = 0;

ISR(PCINT1_vect)
{
	hit = PINC;
}

void tx(uint8_t c)
{
	while(bit_is_clear(UCSR0A, UDRE0));
	UDR0 = c;
}

int main(void)
{
	uint32_t delay = 0;
	uint8_t panel = 0;

	// xbee init
	UBRR0H  = ((F_CPU / 16 + XBEE_BAUDRATE / 2) / XBEE_BAUDRATE - 1) >> 8;
	UBRR0L  = ((F_CPU / 16 + XBEE_BAUDRATE / 2) / XBEE_BAUDRATE - 1);
	UCSR0B |= (1 << TXEN0);
	
	// panel inputs
	DDRC &= ~(1 << PC1);
	DDRC &= ~(1 << PC2);
	DDRC &= ~(1 << PC3);
	DDRC &= ~(1 << PC4);
	
	// led outputs
	DDRC |=  (1 << PC0);
	DDRC |=  (1 << PC5);
	
	// Pin change interrupt 1 enabled. Any change on enabled PCINT13..10 will cause and interupt.
	PCICR  |= (1 << PCIE1);
	PCMSK1 |= (1 << PCINT9);  // PC1
	PCMSK1 |= (1 << PCINT10); // PC2
	PCMSK1 |= (1 << PCINT11); // PC3
	PCMSK1 |= (1 << PCINT12); // PC4
	
	// enable interups
	sei();
	
	while(1)
	{
		if(hit > 0)
		{
		
			// determine panel that was hit
			if      (!(hit & PANEL1)) { delay = MS_SIGNAL * 1; panel = 1; }
			else if (!(hit & PANEL2)) { delay = MS_SIGNAL * 2; panel = 2; }
			else if (!(hit & PANEL3)) { delay = MS_SIGNAL * 3; panel = 3; }
			else                      { delay = MS_SIGNAL * 4; panel = 4; }
			
			// hit output high
			PORTC &= ~(1 << PC0);

			// tx hit packet			
			tx((uint8_t) 0x55);
			tx((uint8_t) TRANSPONDER_ID);
			tx((uint8_t) (255 - TRANSPONDER_ID));
			tx((uint8_t) panel);
			
			// delay and reset hit output
			_delay_ms(delay);
			PORTC |=  (1 << PC0);
			
			// blink LED board 3 times
			for (int x = 0; x < 3; x++)
			{
				PORTC |=  (1 << PC5);
				_delay_ms(LED_RATE);
				PORTC &= ~(1 << PC5);
				_delay_ms(LED_RATE);
			}
			
			// delay for the remaining cooldown period
			_delay_ms(MS_COOLDOWN - LED_PERIOD - delay);
			
			// reset variables
			hit = 0;
			delay = 0;
			panel = 0;
		}
	}

	return 0;
}
