/*
	MWScore Transponder
	
	XBEE setup:
	ATBD = 5 (38400bps)
	ATID = 6200
	MY   = 6200 + TRANSPONDER_ID
	DL   = 6201
	CH   = c
	
	ATMEGA328 Fuse Setting:
	$ sudo avrdude -P usb -c avrispmkII -p m328p -B 100 -F -U lfuse:w:0xce:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m

	To Program:
	$ sudo make program
*/ 
 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define XBEE_BAUDRATE 38400

#define PANELMASK  240
#define PANEL1     112
#define PANEL2     176
#define PANEL3     208
#define PANEL4     224

#define MS_COOLDOWN 1000
#define MS_SIGNAL 50

#define LED_RATE 50
#define LED_PERIOD 300 // LED_RATE * 6

volatile uint8_t hit = 0;

ISR(PCINT2_vect)
{
	hit = PIND;
}

void delay_ms(uint16_t count) {
  while(count--) {
    _delay_ms(1);
  }
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
	uint8_t id;

	// xbee init
	UBRR0H  = ((F_CPU / 16 + XBEE_BAUDRATE / 2) / XBEE_BAUDRATE - 1) >> 8;
	UBRR0L  = ((F_CPU / 16 + XBEE_BAUDRATE / 2) / XBEE_BAUDRATE - 1);
	UCSR0B |= (1 << TXEN0);
	
	// panel inputs
	DDRD &= ~(1 << PD4);
	DDRD &= ~(1 << PD5);
	DDRD &= ~(1 << PD6);
	DDRD &= ~(1 << PD7);
	
	// id inputs
	DDRC = 0;
	
	// led outputs
	DDRD |= (1 << PD2);
	DDRD |= (1 << PD3);
	
	// Pin change interrupt 1 enabled. Any change on enabled PCINT23..16 will cause and interupt.
	PCICR  |= (1 << PCIE2);
	PCMSK2 |= (1 << PCINT20);
	PCMSK2 |= (1 << PCINT21);
	PCMSK2 |= (1 << PCINT22);
	PCMSK2 |= (1 << PCINT23);
	
	// enable interups
	sei();
	
	while(1)
	{
		if(hit != 0)
		{		
			// determine panel that was hit
			if      ((hit & PANELMASK) == PANEL1) { delay = MS_SIGNAL * 1; panel = 1; }
			else if ((hit & PANELMASK) == PANEL2) { delay = MS_SIGNAL * 2; panel = 2; }
			else if ((hit & PANELMASK) == PANEL3) { delay = MS_SIGNAL * 3; panel = 3; }
			else if ((hit & PANELMASK) == PANEL4) { delay = MS_SIGNAL * 4; panel = 4; }
			else                                  { delay = MS_SIGNAL * 5; panel = 5; }
			
			if(panel != 0)
			{			
				// hit output high
				PORTD |= (1 << PD3);

				// tx hit packet
				id = 63 - (0x3f & PINC);
				tx((uint8_t) 0x55);
				tx((uint8_t) id);
				tx((uint8_t) (0xff - id));
				tx((uint8_t) panel);
			
				// delay and reset hit output
				delay_ms(delay);
				PORTD &= ~(1 << PD3);
			
				// blink LED board 3 times
				for (int x = 0; x < 3; x++)
				{
					PORTD |=  (1 << PD2);
					delay_ms(LED_RATE);
					PORTD &= ~(1 << PD2);
					delay_ms(LED_RATE);
				}
			
				// delay for the remaining cooldown period
				delay_ms(MS_COOLDOWN - LED_PERIOD - delay);
			}
			
			// reset variables
			hit = 0;
			delay = 0;
			panel = 0;
		}
	}

	return 0;
}
