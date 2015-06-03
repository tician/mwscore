#include <Wire.h>
#include <SoftwareSerial.h>

#include <avr/EEPROM.h>
// Your 16-bit transponder ID number
uint16_t BotID EEMEM = 0x0002;
// Your bot name
char BotNAME[64] PROGMEM = "mynyr";
// Your team name
char TeamNAME[64] PROGMEM = "doofus";


SoftwareSerial *bogusBus;//(10, 9); // RX, TX
bool usingBogusBus = false;

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define XBEE_RESET	5
#define SOFT_TXD_EN	10

#define D_BOOM		6
#define D_GAMEON	7
#define D_LEDHIT 	8
#define D_FLAG		9

#define LED_USR		13
#define LED_Q1		14
#define LED_Q2		15
#define LED_Q3		16
#define LED_Q4		17

#define BASE_PANEL_ID	0x42
uint8_t numPanels = 0;


///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void setup()
{
	pinMode(SOFT_TXD_EN, INPUT);		// Check if using SoftSerial on FLAG pin
	digitalWrite(SOFT_TXD_EN, HIGH);	// Enable pull-up resistor

	pinMode(D_BOOM, OUTPUT);			// Set HIT/BOOM/DEAD to output
	digitalWrite(D_BOOM, LOW);			// Set output LOW
	pinMode(D_GAMEON, OUTPUT);			// Set GAMEON to output
	digitalWrite(D_GAMEON, LOW);		// Set output LOW
	pinMode(D_LEDHIT, OUTPUT);			// Set LEDHIT to output
	digitalWrite(D_LEDHIT, LOW);		// Set output LOW
	pinMode(D_FLAG, OUTPUT);			// Set FLAG to output
	digitalWrite(D_FLAG, LOW);			// Set output LOW

	pinMode(LED_USR, OUTPUT);			// Set LED_USR to output
	digitalWrite(LED_USR, LOW);			// Turn LED_USR off

	pinMode(LED_Q1, OUTPUT);			// Set LED_Q1 to output
	digitalWrite(LED_Q1, LOW);			// Turn LED_Q1 off
	pinMode(LED_Q2, OUTPUT);			// Set LED_Q2 to output
	digitalWrite(LED_Q2, LOW);			// Turn LED_Q2 off
	pinMode(LED_Q3, OUTPUT);			// Set LED_Q3 to output
	digitalWrite(LED_Q3, LOW);			// Turn LED_Q3 off
	pinMode(LED_Q4, OUTPUT);			// Set LED_Q4 to output
	digitalWrite(LED_Q4, LOW);			// Turn LED_Q4 off


///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Setup software serial port for output on D_FLAG
	if (digitalRead(SOFT_TXD_EN))
	{
		// Not pulled down, so pin D9 is just flag/tagged
		usingBogusBus = false;
	}
	else
	{
		// Pulled down by jumper, so pin D9 is TXD for status on 1[s] interval
		usingBogusBus = true;
		bogusBus = SoftwareSerial(10,9);
		bogusBus->begin(115200);
	}
		




///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Setup external devices
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Setup I2C Panels
	Wire.begin();
	uint8_t iter;
	for (iter=1; iter<=12; iter++)
	{
/*
MW_ITB_I2C properties
	ADDR: NAME
	0x00: Status register
		Bit-0: (R-) IM_HIT (cleared when READ by master)
		Bit-1: (-W) OTHER_HIT
		Bit-2: (-W) HAVE_FLAG
		Bit-3: (RW) RESERVED for future use

		Bit-4: (-W) Save current ID to EEPROM
		Bit-5: (-W) Save current FSR_SDPH to EEPROM
		Bit-6: (-W) Save current FSR_THR to EEPROM
		Bit-7: (-W) RESET (to EEPROM defaults using WDReset)

Default values grabbed from EEPROM at boot
	0x01: ID register (RW) (1~12)
	0x02: FSR Sequential Detections Per Hit register (RW) (1~50)
	0x03: FSR Threshold register (RW) (50~250)
*/
		Wire.beginTransmission(BASE_PANEL_ID+iter);
		Wire.write(0x00); // Set ADDR of register at which to start next read
		// Check for existence and operating parameters
		Wire.requestFrom(PANEL_1+iter, 4);

		uint8_t panel_stat = Wire.read();
		uint8_t panel_ID = Wire.read();
		uint8_t panel_SDPH = Wire.read();
		uint8_t panel_Threshold = Wire.read();

		Wire.endTrasmission();
	}


// Setup XBEE Serial
	Serial.begin(38400);


}





/*
/// ALL TRANSMISSIONS LITTLE-ENDIAN

/// ID may not be 0xFFFF, 0xFFFE, 0xFFFA, 0xFFF5, 0x0000

/// NAN MechWarfare Control System Packet
Header		UINT24				0xFF 0xFF 0xF5 
State		UINT16				GAME STATE
									GxCC xTTT TTTT TTTT
										G = 1 (GAMEON) or 0 (GAMEOFF)
										C = 00 (REGULAR_STATUS_UPDATE)
											01 (POLL_TRANSPONDER)
											10 (START_OF_GAME_DATA)
											11 (REQUEST_TRANSPONDER_SETTINGS)
										T = (11-bit) time remaining in 0.5[s]
										x = unused
Length		UINT8				Length of DATA array in bytes
DATA		UINT8[len]			Data array
Checksum	UINT8				Sum of all bytes in packet

DATA array types
	REGULAR_STATUS_UPDATE ( length = (3*N) )
		ID		UINT16				Transponder ID
		HP		UINT8				Bot Status
										FxHH HHHH
											F = 1 (HAS_FLAG) or 0 (NO_FLAG)
											H = (6-bit) HP remaining
											x = POWERUPS? PENALTIES?

	POLL_TRANSPONDER / REQUEST_TRANSPONDER_SETTINGS ( length = 2 )
		ID		UINT16				Transponder ID

	START_OF_GAME_DATA ( length = (3+(4*N)) )
		Type	UINT8				Match Type
		nBots	UINT8				Number Bots
			ID		UINT16				Transponder ID
			HP		UINT8				Bot Status
			Team	UINT8				Team ID
			nTag	UINT8				Number RFID tags on bot
			Tags	UINT64[ntag]		Array of RFID tag IDs
		nBcns	UINT8				Number Beacons/Bases/Powerups

/// NAN MechWarfare Transponder Response Packet
Header		UINT24				0xFF 0xFF 0xFA
ID			UINT16				Transponder ID
Length		UINT8				Length of DATA array in bytes
DATA		UINT8[len]			Data array
Checksum	UINT8				Sum of all bytes in packet

DATA array types
	POLL_TRANSPONDER response (bot) ( length = 1 )
		HP		UINT8				Current Bot Health
										xxHH HHHH
											H = (6-bit) HP remaining


	POLL_TRANSPONDER response (RFID beacon) ( length = (2*N) )
		ID		UINT16				Current Bot(s) at beacon (if issued a tag LUT)
	POLL_TRANSPONDER response (RFID beacon) ( length = (8*N) )
		ID		UINT64				Current RFID tag(s) at beacon



	REQUEST_TRANSPONDER_SETTINGS response ( length = 130 )
		Bot		UINT8[64]			Bot name
		Team	UINT8[64]			Team name
		class	UINT8				Bot class
										xxxx SLLL
											x = TBD
											S = statically stable
											L = number legs
		nPanels	UINT8				Bitmask of target panels

*/













void loop()
{
	uint8_t iter;


// Poll XBEE for status
	if (Serial.available())
	{
//		Serial.read();





	}



// Poll I2C panels
	uint8_t	whereAttacked = 0;
	for (iter=0; iter<8; iter++)
	{
		Wire.beginTransmission(PANEL_1+iter);
		Wire.requestFrom(PANEL_1+iter, 1);
		if (Wire.read() > 0)
			whereAttacked |= (1<<iter);
		Wire.endTransmission();
	}
	if (whereAttacked>0)
	{
		for (iter=0; iter<8; iter++)
		{
			Wire.beginTransmission(PANEL_1+iter);
			// Set value:		0x01 (FLASH_ONE_SECOND)
				// (also clears/disables panel hit counter until done flashing)
			Wire.write(0x01);
			Wire.endTransmission();
		}
	}

// 



}




