#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <EEPROM.h>
#include <Wire.h>

// MWServer SSID
char ServerSSID[64] = "MechWarfare";
// MWServer PSWD
char ServerPSWD[64] = "robotwars";
// MWServer IP
IPAddress serverIP(192, 168, 49, 13);
uint16_t serverPort = 0x1105;
// MWServer multicast group IP
IPAddress mcastIP(192, 168, 49, 14);
uint16_t mcastPort = 0x1106;


//IPAddress transponderIP;
uint16_t localPort = 0x1105;


// Your 8-bit transponder ID number
uint8_t botID = 0x00;

WiFiUDP mwUDP;


uint32_t serverPacketCount = 0;
uint32_t transponderPacketCount = 0;

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define I2C_ENABLED		1
#define BASE_PANEL_ID	0x42

#define PIN_I2C_SCL		2
#define PIN_I2C_SDA		0
#define PIN_DXL_TXEN 	15

uint8_t numPanels = 0;




uint16_t dxl20_crc_table[256] = {
	0x0000, 0x8005, 0x800F, 0x000A, 0x801B, 0x001E, 0x0014, 0x8011,
	0x8033, 0x0036, 0x003C, 0x8039, 0x0028, 0x802D, 0x8027, 0x0022,
	0x8063, 0x0066, 0x006C, 0x8069, 0x0078, 0x807D, 0x8077, 0x0072,
	0x0050, 0x8055, 0x805F, 0x005A, 0x804B, 0x004E, 0x0044, 0x8041,
	0x80C3, 0x00C6, 0x00CC, 0x80C9, 0x00D8, 0x80DD, 0x80D7, 0x00D2,
	0x00F0, 0x80F5, 0x80FF, 0x00FA, 0x80EB, 0x00EE, 0x00E4, 0x80E1,
	0x00A0, 0x80A5, 0x80AF, 0x00AA, 0x80BB, 0x00BE, 0x00B4, 0x80B1,
	0x8093, 0x0096, 0x009C, 0x8099, 0x0088, 0x808D, 0x8087, 0x0082,
	0x8183, 0x0186, 0x018C, 0x8189, 0x0198, 0x819D, 0x8197, 0x0192,
	0x01B0, 0x81B5, 0x81BF, 0x01BA, 0x81AB, 0x01AE, 0x01A4, 0x81A1,
	0x01E0, 0x81E5, 0x81EF, 0x01EA, 0x81FB, 0x01FE, 0x01F4, 0x81F1,
	0x81D3, 0x01D6, 0x01DC, 0x81D9, 0x01C8, 0x81CD, 0x81C7, 0x01C2,
	0x0140, 0x8145, 0x814F, 0x014A, 0x815B, 0x015E, 0x0154, 0x8151,
	0x8173, 0x0176, 0x017C, 0x8179, 0x0168, 0x816D, 0x8167, 0x0162,
	0x8123, 0x0126, 0x012C, 0x8129, 0x0138, 0x813D, 0x8137, 0x0132,
	0x0110, 0x8115, 0x811F, 0x011A, 0x810B, 0x010E, 0x0104, 0x8101,
	0x8303, 0x0306, 0x030C, 0x8309, 0x0318, 0x831D, 0x8317, 0x0312,
	0x0330, 0x8335, 0x833F, 0x033A, 0x832B, 0x032E, 0x0324, 0x8321,
	0x0360, 0x8365, 0x836F, 0x036A, 0x837B, 0x037E, 0x0374, 0x8371,
	0x8353, 0x0356, 0x035C, 0x8359, 0x0348, 0x834D, 0x8347, 0x0342,
	0x03C0, 0x83C5, 0x83CF, 0x03CA, 0x83DB, 0x03DE, 0x03D4, 0x83D1,
	0x83F3, 0x03F6, 0x03FC, 0x83F9, 0x03E8, 0x83ED, 0x83E7, 0x03E2,
	0x83A3, 0x03A6, 0x03AC, 0x83A9, 0x03B8, 0x83BD, 0x83B7, 0x03B2,
	0x0390, 0x8395, 0x839F, 0x039A, 0x838B, 0x038E, 0x0384, 0x8381,
	0x0280, 0x8285, 0x828F, 0x028A, 0x829B, 0x029E, 0x0294, 0x8291,
	0x82B3, 0x02B6, 0x02BC, 0x82B9, 0x02A8, 0x82AD, 0x82A7, 0x02A2,
	0x82E3, 0x02E6, 0x02EC, 0x82E9, 0x02F8, 0x82FD, 0x82F7, 0x02F2,
	0x02D0, 0x82D5, 0x82DF, 0x02DA, 0x82CB, 0x02CE, 0x02C4, 0x82C1,
	0x8243, 0x0246, 0x024C, 0x8249, 0x0258, 0x825D, 0x8257, 0x0252,
	0x0270, 0x8275, 0x827F, 0x027A, 0x826B, 0x026E, 0x0264, 0x8261,
	0x0220, 0x8225, 0x822F, 0x022A, 0x823B, 0x023E, 0x0234, 0x8231,
	0x8213, 0x0216, 0x021C, 0x8219, 0x0208, 0x820D, 0x8207, 0x0202
};

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void setup()
{
// Setup Serial
	Serial.begin(115200);

// Start up esp8266 EEPROM emulation
	// EEPROM library uses one sector of flash located at 0x7b000 for storage.
//	EEPROM.begin(4096);


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
	mwUDP.begin(localPort);
	Serial.print("Local port: ");
	Serial.println(mwUDP.localPort());


 
// Connect to multicast group
	mwUDP.beginMulticast(WiFi.localIP(), mcastIP, mcastPort);


	int resp = mwUDP.parsePacket();
	if (!resp)
	{
		Serial.println("No packet yet...");
	}

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
	0x01: ID register									(RW) (0x00~0x1F)
	0x02: FSR Sequential Detections Per Hit register	(RW) (1~50)
	0x03: FSR Threshold register						(RW) (50~250)
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
State		UINT8				GAME STATE
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
											F = 1 (HAS_FLAG) or 0 (NO_FLAG)
											C = 1 (CAPTURING_POINT) or 0 (NOPE)
											H = (10-bit) HP remaining
											x = POWERUPS? PENALTIES?

	START_OF_GAME_DATA (multicast) ( length = (3+(4*N)) )
		mType	UINT8				Match Type
		nBots	UINT8				Number Bots
			ID		UINT8				Transponder ID
			Team	UINT8				Team ID
			HP		UINT16				Bot Status
//			nTag	UINT8				Number RFID tags on bot
//			Tags	UINT64[ntag]		Array of RFID tag IDs
		nBcns	UINT8				Number Beacons/Bases/Powerups

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
	int resp = mwUDP.parsePacket();
	if (resp>=9)	// minimum valid packet length is 9
	{
		uint8_t *buffy = new uint8_t[resp];
		if (buffy!=NULL)
		{
			// Copy to buffer
			mwUDP.read(buffy, resp);
		}
		else
		{
			// Failed to allocate buffer
			delete[] buffy;
			// Discard packet
			mwUDP.flush();
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




