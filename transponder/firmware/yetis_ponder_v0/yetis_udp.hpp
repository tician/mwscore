/*
 *******************************************************************************
 * YETIS MechWarfare - UDP Interface for ESP8266 YETIS-ponder
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


/*
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// ALL TRANSMISSIONS LITTLE-ENDIAN
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// YETIS MechWarfare Transponder 'Connect'/'Multicast Test' Request Packet
// (total_size = 1+3+1+2+Length+2 = 9+Length)
Header		UINT8				0xF0
Counter		UINT24				Packet Counter (default to 0 for connect)
ID			UINT8				Transponder ID (default to 0 for connect)
Length		UINT16				Length of DATA array in bytes (4 bytes)
DATA		UINT8[Length]		Data array (4-byte ChipID)
CRC			UINT16				DXL2.0 CRC




/// YETIS MechWarfare Control System Packet
// (total_size = 1+3+1+2+ Length +2 = 9+Length) (Length>=2)
Header		UINT8				0xF5
Counter		UINT24				Packet Counter (dump if older than last)
State		UINT8				GAME STATE + INSTRUCTION/COMMAND
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
Length		UINT16				Length of DATA array in bytes
Time		UINT16				Match Time Remaining in 0.1[s]
DATA		UINT8[Length-2]		Data array
CRC			UINT16				DXL2.0 CRC

DATA array types
	REGULAR_STATUS_UPDATE (multicast) ( Length = (3*N) )
		ID		UINT8				Transponder ID
		HP		UINT16				Bot Status
										WFCx xxHH HHHH HHHH
											W = 1 (WEAPONS_ARMED) or 0 (SAFE)
											F = 1 (HAS_FLAG) or 0 (NOPE)
											C = 1 (CAPTURING_BASE) or 0 (NOPE)
											H = (10-bit) HP remaining
											x = POWERUPS? PENALTIES?

	START_OF_GAME_DATA (multicast) ( Length = (3+(4*N)) )
		mType	UINT8				Match Type
		nBots	UINT8				Number Bots
		nBcns	UINT8				Number Beacons/Bases/Powerups
			ID		UINT8				Transponder ID
			Team	UINT8				Team ID
			HP		UINT16				Bot Status
//			nTag	UINT8				Number RFID tags on bot
//			Tags	UINT64[ntag]		Array of RFID tag IDs

	TRANSPONDER_SETUP (unicast) ( Length = 10 )
		ID		UINT8				Transponder ID
		Count	UINT24				Initial Transponder Packet Counter Value
										(random value (16~22-msb) assigned and tracked by server)
		mcastIP	UINT8[4]			Multicast IP address
		mcastPo UINT16				Multicast Port



///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// YETIS MechWarfare Transponder Response Packet
// (total_size = 1+3+1+2+Length+2 = 9+Length)
Header		UINT8				0xF5
Counter		UINT24				Packet Counter (dump if older than last)
									(each transponder counter initialized to random number by server at setup and tracked by server)
ID			UINT8				Transponder ID
Length		UINT16				Length of DATA array in bytes
DATA		UINT8[Length]		Data array
CRC			UINT16				DXL2.0 CRC

DATA array types
	POLL_TRANSPONDER response (bot) ( Length = 2 )
		HP		UINT16				Current Bot Health
										Wxxx xxHH HHHH HHHH
											W = 1 (WEAPONS_ARMED) or 0 (SAFE)
											H = (10-bit) HP remaining
											x = unused

//	POLL_TRANSPONDER response (RFID beacon) ( Length = (1*N) )
//		ID		UINT8				Current Bot(s) at beacon (if issued a tag LUT)
	POLL_TRANSPONDER response (RFID beacon) ( Length = (8*N) )
		ID		UINT64				Current RFID tag(s) at beacon

//	REQUEST_TRANSPONDER_SETTINGS response ( Length = 130 )
//		Bot		UINT8[64]			Bot name
//		Team	UINT8[64]			Team name
//		class	UINT8				Bot class
//										xxxx SLLL
//											x = TBD
//											S = statically stable
//											L = number legs
	REQUEST_TRANSPONDER_SETTINGS response ( Length = 1 )
		Config	UINT8				Bot Armament
										WWWx PPPP
											W = Number of I2C weapons found
											P = Number of I2C target panels found
											x = unused


///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// YETIS MechWarfare Transponder Passthrough Packet
// (total_size = 1+3+1+2+Length+2 = 9+Length) (Length>=0)
Header		UINT8				0xFD
Counter		UINT24				Packet Counter (dump if older than last)
									(each transponder counter initialized to random number by server at setup and tracked by server)
ID			UINT8				Transponder ID
Length		UINT16				Length of DATA array in bytes
DATA		UINT8[Length]		Data array
CRC			UINT16				DXL2.0 CRC



///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// YETIS MechWarfare Transponder Motion Command Packet
// (total_size = 1+3+1+2+ Length +2 = 9+Length) (Length>=1)
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
DATA		UINT8[Length-1]		Data array
CRC			UINT16				DXL2.0 CRC



///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// YETIS MechWarfare Transponder Motion Response Packet
// (total_size = 1+3+1+2+ Length +2 = 9+Length) (Length>=2)
Header		UINT8				0xFA
Counter		UINT24				Packet Counter (dump if older than last)
									(each transponder counter initialized to random number by server at setup and tracked by server)
ID			UINT8				Transponder ID
Length		UINT16				Length of DATA array in bytes
INST		UINT8				Instruction/Response Type
ERROR		UINT8				Errors
DATA		UINT8[Length-2]		Data array
CRC			UINT16				DXL2.0 CRC


*/


#ifndef _YETIS_MW_UDP_H_
#define _YETIS_MW_UDP_H_

#include <ESP8266WiFi.h>
#include <WiFiUdp.h>

namespace mechwarfare
{
#define YETIS_UDP_BUFFER_SIZE			160

#define HEADER_CONNECT					0xF0
#define HEADER_STATUS					0xF5
#define HEADER_MOTION					0xFA
#define HEADER_PASSTHRU					0xFD

	class yetisUDP
	{
	private:
		dynamixel::crc	checker;

		WiFiUDP udp;

		// MWServer IP
		IPAddress ServerIP;//(192, 168, 49, 13);
		uint16_t ServerPort;// = 0x1105;

		// MWServer multicast group IP
		IPAddress McastIP;//(192, 168, 49, 14);
		uint16_t McastPort;// = 0x1106;

		uint16_t LocalPort;// = 0x1105;

		uint32_t ServerPacketCount;
		uint32_t TransponderPacketCount;

		// Your 8-bit transponder ID number
		uint8_t TransponderID;
		// ESP8266 chip ID number
		uint32_t ChipID;

		// Game State from Server
		uint8_t GameState;
		// Game Time from Server
		uint16_t GameTime;

		// Transponder State/HP
		uint16_t MyState;

		buffy[YETIS_UDP_BUFFER_SIZE];

	protected:
		
	public:
		
		uint8_t myID() { return TransponderID; }
		uint8_t globalState() { return GameState; }
		uint16_t timeLeft() { return GameTime; }

		uint16_t myState() { return myState; }
	};






}//namespace mechwarfare

#endif //_YETIS_MW_UDP_H_
