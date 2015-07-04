/*
 *******************************************************************************
 * YETIS MechWarfare - Transponder
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

#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <EEPROM.h>
#include <Wire.h>
#include "dynamixel.hpp"
#include "yetis_udp.hpp"
#include "yetis_i2c.hpp"

// MWServer SSID
char ServerSSID[] = "MechWarfare";
// MWServer PSWD
char ServerPSWD[] = "robotwars";

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define I2C_ENABLED		1

#define PIN_I2C_SCL		2
#define PIN_I2C_SDA		0
#define PIN_DXL_TXEN 	15

dynamixel::dxl10 		dxlAX(&Serial, PIN_DXL_TXEN);
dynamixel::dxl20 		dxlXL(&Serial, PIN_DXL_TXEN);
mechwarfare::yetisUDP	MWclient;
mechwarfare::yetisI2C	MWdevices(PIN_I2C_SDA,PIN_I2C_SCL);

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void setup()
{
// Setup Serial
	Serial.begin(115200);

// Setup wifi
	Serial.print("Connecting to ");
	Serial.println(ServerSSID);
	WiFi.begin(ServerSSID, ServerPASS);

	while (WiFi.status() != WL_CONNECTED)
	{
		delay(500);
		Serial.print(".");
	}
	Serial.println("");

	Serial.println("WiFi connected");
	Serial.println("IP address: ");
	Serial.println(WiFi.localIP());



	Serial.println("Starting UDP");
	yetisUDP.begin(localPort);
	Serial.print("Local port: ");
	Serial.println(yetisUDP.localPort());


// Start up esp8266 EEPROM emulation
	// EEPROM library uses one sector of flash located at 0x7b000 for storage.
//	EEPROM.begin(4096);











	if (I2C_ENABLED)
	{
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Setup external devices
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Setup I2C Panels
		Wire.begin(PIN_I2C_SDA, PIN_I2C_SCL); // Wire.begin(sda, scl)
		uint8_t iter;
		for (iter=1; iter<=12; iter++)
		{
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



/*
MW_TOPLED_I2C properties
	ADDR: NAME
	0x00: Status register
		Bit-0: (RW) RESERVED for future use
		Bit-1: (-W) PANEL_HIT
		Bit-2: (-W) HAVE_FLAG
		Bit-3: (RW) RESERVED for future use

		Bit-4: (-W) Save current ID to EEPROM
		Bit-5: (-W) RESERVED for future use
		Bit-6: (-W) RESERVED for future use
		Bit-7: (-W) RESET (to EEPROM defaults using WDReset)

Default values grabbed from EEPROM at boot
	0x01: ID register									(RW) (0x20~0x2F)
*/


/*
MW_FCB_I2C properties
	ADDR: NAME
	0x00: Status register
		Bit-0: (RW) WEAPONS_FREE
		Bit-1: (R-) OUT_OF_AMMO
		Bit-2: (-W) FIRE (1[s] burst if PWM only) (1 round if monitored)
		Bit-3: (RW) RESERVED for future use

		Bit-4: (-W) Save current ID to EEPROM
		Bit-5: (-W) Save current MAX_AMMO_CAP to EEPROM
		Bit-6: (-W) Save current FIRE_PWM to EEPROM
		Bit-7: (-W) RESET (to EEPROM defaults using WDReset)

Default values grabbed from EEPROM at boot
	0x01: ID register									(RW) (0x50~0x5F)
	0x02: Estimated ammo remaining(L)					(RW) (0x0000~0xFFFF)
	0x03: Estimated ammo remaining(H)					(RW) (0x0000~0xFFFF)
	0x04: Maximum ammo capacity(L)						(RW) (0x0000~0xFFFF)
	0x05: Maximum ammo capacity(H)						(RW) (0x0000~0xFFFF)
	0x06: Fire control PWM value(L)						(RW) (0x0000~0xFFFF)
	0x07: Fire control PWM value(H)						(RW) (0x0000~0xFFFF)
*/

	}
	else
	{
		// Use SCL as semi-intelligent buss DATA pin
		pinMode(PIN_I2C_SCL, INPUT);		// Set PIN_I2C_SCL to input
		digitalWrite(PIN_I2C_SCL, LOW);		// Disable pull-up resistor (use external)

		// Use SDA as !fire! control pin?
		pinMode(PIN_I2C_SDA, OUTPUT);		// Set PIN_I2C_SDA to output
		digitalWrite(PIN_I2C_SDA, HIGH);	// Set output HIGH
	}
	// Use as DXL_TXEN for DXL, or as PULSE_OUT for FTDI
	pinMode(PIN_DXL_TXEN, OUTPUT);			// Set PIN_DXL_TXEN to output
	digitalWrite(PIN_DXL_TXEN, LOW);		// Set output LOW






}





/*
<MWBOT>
  <!-- Transponder ChipID -->
  <chip></chip>

  <!-- Bot Name -->
  <name></name>

  <!-- Bot Description (optional) -->
  <description></description>

  <!-- Number of Legs (2, 3, 4) -->
  <legs></legs>
  
  <!-- Statically Stable (for 'twitch'-like bipeds/tripeds) -->
  <stable></stable>

  <!-- Number of Target Panels -->
  <targets></targets>

  <!-- Bot Class (TBD)-->
  <class></class>

  <!-- RFID Tags -->
  <rfid>
    <!-- RFID Tag Count (named tag_0 to tag_(N-1)) -->
    <count></count>
    <!-- RFID Tag Number/Code -->
    <tag_0>
      <id></id>
    </tag_0>
    ...
  </rfid>
</MWBOT>
*/




/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// ALL TRANSMISSIONS LITTLE-ENDIAN
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// NAN MechWarfare Control System Packet
Header		UINT8				0xF5
Counter		UINT24				Packet Counter (dump if older than last)
State		UINT8				GAME STATE / INSTRUCTION
									GGGx xxCC
										G = 000 (GAMEOFF) (SAFE)
											001 (TRANSPONDER_CHECKOUT) (SAFE)
											010 (BOT_CHECKOUT) (SAFE)
											100 (WEAPON_CHECKOUT) (WEAPONS_FREE)
											011 (READY_TO_PLAY) (SAFE)
											111 (GAMEON) (WEAPONS_FREE)
										x = unused
										C = 00 (REGULAR_STATUS_UPDATE)
											01 (START_OF_GAME_DATA)
											10 (TRANSPONDER_SETUP)
//											11 (REQUEST_TRANSPONDER_SETTINGS)
Time		UINT16				Match Time Remaining in 0.1[s]
Length		UINT16				Length of DATA array in bytes
DATA		UINT8[len]			Data array
CRC			UINT16				DXL2.0 CRC

DATA array types
	REGULAR_STATUS_UPDATE (multicast) ( length = (3*N) )
		ID		UINT8				Transponder ID
		HP		UINT16				Bot Status
										WFCx xxHH HHHH HHHH
											W = 1 (WEAPONS_ARMED) or 0 (SAFE)
											F = 1 (HAS_FLAG) or 0 (NOPE)
											C = 1 (CAPTURING_BASE) or 0 (NOPE)
											H = (10-bit) HP remaining
											x = POWERUPS? PENALTIES?

	START_OF_GAME_DATA (multicast) ( length = (3+(4*N)) )
		mType	UINT8				Match Type
		nBots	UINT8				Number Bots
		nBcns	UINT8				Number Beacons/Bases/Powerups
			ID		UINT8				Transponder ID
			Team	UINT8				Team ID
			HP		UINT16				Bot Status
//			nTag	UINT8				Number RFID tags on bot
//			Tags	UINT64[ntag]		Array of RFID tag IDs

	TRANSPONDER_SETUP (unicast) ( length = 4/8 )
//		IP		UINT8[4]			Transponder IP address
		ID		UINT8				Transponder ID
		Count	UINT24				Initial Transponder Packet Counter Value
										(random value (22-msb) assigned and tracked by server)



///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// NAN MechWarfare Transponder Response Packet
Header		UINT8				0xF5
Counter		UINT24				Packet Counter (dump if older than last)
									(each transponder counter initialized to random number by server at setup and tracked by server)
ID			UINT8				Transponder ID
Length		UINT16				Length of DATA array in bytes
DATA		UINT8[len]			Data array
CRC			UINT16				DXL2.0 CRC

DATA array types
	POLL_TRANSPONDER response (bot) ( length = 2 )
		HP		UINT16				Current Bot Health
										Wxxx xxHH HHHH HHHH
											W = 1 (WEAPONS_ARMED) or 0 (SAFE)
											H = (10-bit) HP remaining
											x = unused

//	POLL_TRANSPONDER response (RFID beacon) ( length = (1*N) )
//		ID		UINT8				Current Bot(s) at beacon (if issued a tag LUT)
	POLL_TRANSPONDER response (RFID beacon) ( length = (8*N) )
		ID		UINT64				Current RFID tag(s) at beacon

//	REQUEST_TRANSPONDER_SETTINGS response ( length = 130 )
//		Bot		UINT8[64]			Bot name
//		Team	UINT8[64]			Team name
//		class	UINT8				Bot class
//										xxxx SLLL
//											x = TBD
//											S = statically stable
//											L = number legs
	REQUEST_TRANSPONDER_SETTINGS response ( length = 1 )
		Config	UINT8				Bot Armament
										WWWx PPPP
											W = Number of I2C weapons found
											P = Number of I2C target panels found
											x = unused


///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// NAN MechWarfare Transponder Passthrough Packet
Header		UINT8				0xFD
Counter		UINT24				Packet Counter (dump if older than last)
									(each transponder counter initialized to random number by server at setup and tracked by server)
ID			UINT8				Transponder ID
Length		UINT16				Length of DATA array in bytes
DATA		UINT8[len]			Data array
CRC			UINT16				DXL2.0 CRC



///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// NAN MechWarfare Transponder Motion Command Packet
Header		UINT8				0xFA
Counter		UINT24				Packet Counter (dump if older than last)
									(each transponder counter initialized to random number by server at setup and tracked by server)
ID			UINT8				Transponder ID
Length		UINT16				Length of DATA array in bytes
INST		UINT8				Instruction/Response Type
									0x00 = STOP
									0x01 = Store pose, but do not yet play
									0x02 = Start interpolating to last sent pose
									0x03 = Interpolate to this pose from current
									0x0 = 
DATA		UINT8[len]			Data array
CRC			UINT16				DXL2.0 CRC



///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// NAN MechWarfare Transponder Motion Response Packet
Header		UINT8				0xFA
Counter		UINT24				Packet Counter (dump if older than last)
									(each transponder counter initialized to random number by server at setup and tracked by server)
ID			UINT8				Transponder ID
Length		UINT16				Length of DATA array in bytes
INST		UINT8				Instruction/Response Type
ERROR		UINT8				Errors
DATA		UINT8[len]			Data array
CRC			UINT16				DXL2.0 CRC


*/














void loop()
{
	uint8_t iter;




// Poll wifi for status
	int resp = yetisUDP.parsePacket();
	if (resp>=9)	// minimum valid packet length is 9
	{
		uint8_t *buffy = new uint8_t[resp];
		if (buffy!=NULL)
		{
			// Copy to buffer
			yetisUDP.read(buffy, resp);
		}
		else
		{
			// Failed to allocate buffer
			delete[] buffy;
			// Discard packet
			yetisUDP.flush();
		}

		// Handle Status Update
		if (buffy[0] == 0xF5)
		{
			// Get server counter (and compare to last received before CRC?)
			uint32_t count = (buffy[1]) | (buffy[2]<<8) | (buffy[3]<<16);

			// Get game state
			uint8_t state = buffy[4];

			// Get time remaining
			uint16_t time = (buffy[5]) | (buffy[6]<<8);

			// Length of data array
			uint16_t len = (buffy[7]) | (buffy[8]<<8);

			// Easier to grab data with new array pointer
			uint8_t *dat = buffy[9];

			// Get CRC value
			uint16_t crc = (dat[len+0]) | (dat[len+1]<<8);
			
			uint16_t tempcrc = 0;
			for (iter=0; iter<(resp-2); iter++)
			{
				uint8_t index = (uint8_t) ((tempcrc >> 8)^buffy[iter]);//&0xFF;
				tempcrc = (uint16_t) ((tempcrc<<8) ^ dxl20_crc_table[index]);
			}
			// Crappity, crap, crap, crap
			if (tempcrc != crc)
			{
				delete[] buffy;
				break;
			}
			// Valid, but old. Discard
			if (count < serverPacketCount)
			{
				delete[] buffy;
				break;
			}
			else
			{
				serverPacketCount = count;
			}
			
			// Handle game state update for weapons
			if (!state&(1<<7))
			{
//				disarmWeapons();
			}
		}
		// Handle Passthrough
		else if (buffy[0] == 0xFD)
		{

		}
		// Handle Motion
		else if (buffy[0] == 0xFA)
		{

		}
		else
		{
			// WTF?!
			delete[] buffy;
		}

		
	}


	if (Serial.available())
	{
//		Serial.read();





	}



	if (I2C_ENABLED)
	{
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
	}
	else
	{
	// Check semi-intelligent buss
	
	}



}




