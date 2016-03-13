/*
 *******************************************************************************
 * YETIS MechWarfare - UDP Interface for ESP8266 YETIS-ponder
 *******************************************************************************
 * Copyright (c) 2015, 2016, Matthew Paulishen.
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
 *     * Neither the name of VersaCoMa nor the names of its contributors
 *       may be used to endorse or promote products derived from this
 *       software without specific prior written permission.
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
#include "yetis_udp.h"

namespace mechwarfare
{

yetisUDP::yetisUDP()
{
	ServerIP = {192, 168, 49, 13};
	ServerPort = 0x1105;

	ServerPacketCount = 0;
	TransponderPacketCount = 0;
	TransponderID = 0;
	ChipID = getChipId();
}

yetisUDP::begin()
{
//	Serial.println("Starting UDP");
	udp.begin(LocalPort);
//	Serial.print("Local port: ");
//	Serial.println(udp.localPort());
}

uint8_t yetisUDP::connect(IPAddress ip, uint16_t port)
{
	ServerIP = ip;
	ServerPort = port;
	return connect();
}

uint8_t yetisUDP::connect()
{
	uint8_t tempByte = 0;
	uint16_t tempShort = 0;
	uint32_t tempLong = 0;

// Send initial configuration packet to server
	uint8_t pak[13];
	pak[0] = HEADER_CONNECT;								// header
	pak[1] = (uint8_t) (TransponderPacketCount>>0)&0xFF;	// count byte-1
	pak[2] = (uint8_t) (TransponderPacketCount>>8)&0xFF;	// count byte-2
	pak[3] = (uint8_t) (TransponderPacketCount>>16)&0xFF;	// count byte-3
	pak[4] = TransponderID;									// ID
	pak[5] = 0x04;											// length LSB
	pak[6] = 0x00;											// length MSB
	pak[7]  = (uint8_t) (ChipID>>0)&0xFF;					// chipID byte-1
	pak[8]  = (uint8_t) (ChipID>>8)&0xFF;					// chipID byte-2
	pak[9]  = (uint8_t) (ChipID>>16)&0xFF;					// chipID byte-3
	pak[10] = (uint8_t) (ChipID>>24)&0xFF;					// chipID byte-4

	tempShort = checker.crc(pak, 11, 0);
	pak[11] = (uint8_t) (tempShort>>0)&0xFF;				// CRC LSB
	pak[12] = (uint8_t) (tempShort>>8)&0xFF;				// CRC MSB

	udp.beginPacket(ServerIP, ServerPort);
	udp.write(pak, 13);
	udp.endPacket();

// Get configuration response from server
	int resp;
	resp = udp.parsePacket();
	while (!resp)
	{
//		Serial.println("No packet yet...");
		delay(5);
		resp = udp.parsePacket();
	}

// Parse Unicast Transponder Configuration Packet
	tempByte = ERROR_RECEIVED_NO_PACKET;
	tempShort = 0;
	while ( (tempByte != ERROR_NONE) && (tempShort < 10) )
	{
		tempByte = handleServerPacket(20);
		tempShort++;
	}
	if ( tempByte != ERROR_NONE )
	{
		return ERROR_UNICAST_CONFIG_FAILED;
	}


// Connect to multicast group
	udp.beginMulticast(WiFi.localIP(), McastIP, McastPort);

// Send multicast test request to server
	pak[0] = HEADER_CONNECT;								// header
	pak[1] = (uint8_t) (TransponderPacketCount>>0)&0xFF;	// count byte-1
	pak[2] = (uint8_t) (TransponderPacketCount>>8)&0xFF;	// count byte-2
	pak[3] = (uint8_t) (TransponderPacketCount>>16)&0xFF;	// count byte-3
	pak[4] = TransponderID;									// ID
	pak[5] = 0x04;											// length LSB
	pak[6] = 0x00;											// length MSB
	pak[7]  = (uint8_t) (ChipID>>0)&0xFF;					// chipID byte-1
	pak[8]  = (uint8_t) (ChipID>>8)&0xFF;					// chipID byte-2
	pak[9]  = (uint8_t) (ChipID>>16)&0xFF;					// chipID byte-3
	pak[10] = (uint8_t) (ChipID>>24)&0xFF;					// chipID byte-4

	tempShort = checker.crc(pak, 11, 0);
	pak[11] = (uint8_t) (tempShort>>0)&0xFF;				// CRC LSB
	pak[12] = (uint8_t) (tempShort>>8)&0xFF;				// CRC MSB

	udp.beginPacket(ServerIP, ServerPort);
	udp.write(pak, 13);
	udp.endPacket();
	TransponderPacketCount++;

// Parse Multicast Test Packet
	tempByte = ERROR_RECEIVED_NO_PACKET;
	tempShort = 0;
	while ( (tempByte != ERROR_NONE) && (tempShort < 10) )
	{
		tempByte = handleServerPacket(20);
		tempShort++;
	}
	if ( tempByte != ERROR_NONE )
	{
		return ERROR_MULTICAST_TEST_FAILED;
	}



	return ERROR_NONE;
}

uint8_t yetisUDP::pushTransponderUpdate()
{
	uint16_t tempShort = 0;
	uint8_t pak[11];

	// Send HP/WeaponState update to server
	pak[0] = HEADER_STATUS;									// header
	pak[1] = (uint8_t) (TransponderPacketCount>>0)&0xFF;	// count byte-1
	pak[2] = (uint8_t) (TransponderPacketCount>>8)&0xFF;	// count byte-2
	pak[3] = (uint8_t) (TransponderPacketCount>>16)&0xFF;	// count byte-3
	pak[4] = TransponderID;									// ID
	pak[5] = 0x02;											// length LSB
	pak[6] = 0x00;											// length MSB
	pak[7]  = (uint8_t) (MyState>>0)&0xFF;					// state LSB
	pak[8]  = (uint8_t) (MyState>>8)&0xFF;					// state MSB
				//0x8F; // ignore Flag and Capturing?

	tempShort = checker.crc(pak, 9, 0);
	pak[9] = (uint8_t) (tempShort>>0)&0xFF;					// CRC LSB
	pak[10] = (uint8_t) (tempShort>>8)&0xFF;				// CRC MSB

	udp.beginPacket(ServerIP, ServerPort);
	udp.write(pak, 11);
	udp.endPacket();
	TransponderPacketCount++;

	return ERROR_NONE;
}

uint8_t yetisUDP::handleServerPacket(uint8_t timeout)
{
// Wait for packet or 'timeout'
	int resp = udp.parsePacket();
	if (!resp)
	{
		delay(timeout);
		resp = udp.parsePacket();
	}
	if (!resp)
	{
		return ERROR_RECEIVED_NO_PACKET;
	}

	if ( udp.destinationIP() == WiFi.localIP() )
	{
		return handleUnicast();
	}
	else if ( udp.destinationIP() == McastIP )
	{
		return handleMulticast();
	}
	else
	{
		udp.flush();
		return ERROR_UNKNOWN_DESTINATION_IP;
	}
}

uint8_t yetisUDP::handleMulticast()
{
	// clear buffer
	memset(buffy, 0, YETIS_UDP_BUFFER_SIZE);

	uint8_t tempByte = 0;
	uint16_t tempShort = 0;
	uint32_t tempLong = 0;

	// Grab packet to big buffer
	int packLen = 0;
	int fullLen = udp.available();
	if ( fullLen < YETIS_UDP_BUFFER_SIZE )
	{
		udp.read(buffy, fullLen);
	}
	else
	{
		udp.flush();
		return ERROR_INPUT_BUFFER_OVERRUN;
	}

	// Extract CRC and verify
	tempShort = buffy[fullLen-2] + (buffy[fullLen-1]<<8);
	if ( tempShort != checker.crc(buffy, fullLen-2, 0) )
	{
		return ERROR_CRC_MISMATCH;
	}

	// Extract 24-bit serverPacketCount
	tempLong = (buffy[1]<<0) + (buffy[2]<<8) + (buffy[3]<<16);
	if ( tempLong == 0 )
	{
		return ERROR_SERVER_COUNT_NULL;
	}
	if ( tempLong > ServerPacketCount )
	{
		ServerPacketCount = tempLong;
	}
	else
	{
		return ERROR_OLD_SERVER_PACKET;
	}

	// Extract GameState/Instruction
	tempByte = buffy[4];
	// Extract Data Length
	packLen = buffy[5] + (buffy[6]<<8);

	// Status Packet
	if ( buffy[0] == HEADER_STATUS )
	{
		GameState = tempByte;
		// Extract GameTime
		GameTime = buffy[7] + (buffy[8]<<8);

		if ( (GameState&0x03) == INST_STATUS_UPDATE )
		{
			// Check for WeaponState/Powerups/Penalties for ID
			if ( ((packLen-2)%3) != 0 )
			{
				return ERROR_UNEXPECTED_DATA_LENGTH;
			}
			tempByte = (packLen - 2)/3;
			tempShort = 0;

			uint8_t iter;
			for (iter=0; iter<tempByte; iter++)
			{
				// Extract 8-bit transponderID
				if ( buffy[9+(3*iter)] == TransponderID )
				{
					tempShort = (buffy[10+(3*iter)]<<0) + (buffy[11+(3*iter)]<<8);
					break;
				}
			}
			// Clear WeaponState/Powerups/Penalties
			MyState &= 0x03FF;
			// Check for server instituting penalty HP loss
			if ( (tempShort&0x03FF) < MyState )
			{
				MyState = tempShort;
			}
			else
			{
				MyState |= (tempShort&0xE000);
			}
			// Weapons Free?
			if ( (MyState&0x8000) > 0 )
			{
				enableWeapons();
			}
			else
			{
				disableWeapons();
			}
			// Have Flag?
			if ( (MyState&0x4000) > 0 )
			{

			}
			// Capturing Point?
			if ( (MyState&0x2000) > 0 )
			{

			}

			pushTransponderUpdate();

			return ERROR_NONE;
		}
		else
		{
			return ERROR_UNEXPECTED_INSTRUCTION;
		}
	}
	else
	{
		return ERROR_UNKNOWN_HEADER_TYPE;
	}


	return ERROR_NONE;
}

uint8_t yetisUDP::handleUnicast()
{
	// clear buffer
	memset(buffy, 0, YETIS_UDP_BUFFER_SIZE);

	uint8_t tempByte = 0;
	uint16_t tempShort = 0;
	uint32_t tempLong = 0;

	// Grab packet to big buffer
	int packLen = 0;
	int fullLen = udp.available();
	if ( fullLen < YETIS_UDP_BUFFER_SIZE )
	{
		udp.read(buffy, fullLen);
	}
	else
	{
		udp.flush();
		return ERROR_INPUT_BUFFER_OVERRUN;
	}

	// Extract CRC and verify
	tempShort = buffy[fullLen-2] + (buffy[fullLen-1]<<8);
	if ( tempShort != checker.crc(buffy, fullLen-2, 0) )
	{
		return ERROR_CRC_MISMATCH;
	}

	// Extract 24-bit serverPacketCount
	tempLong = (buffy[1]<<0) + (buffy[2]<<8) + (buffy[3]<<16);
	if ( tempLong == 0 )
	{
		return ERROR_SERVER_COUNT_NULL;
	}
	if ( tempLong > ServerPacketCount )
	{
		ServerPacketCount = tempLong;
	}
	else
	{
		return ERROR_OLD_SERVER_PACKET;
	}

	// Extract target transponder ID or GameState/Instruction
	tempByte = buffy[4];
	// Extract Data Length
	packLen = buffy[5] + (buffy[6]<<8);

	// Status Packet
	if ( buffy[0] == HEADER_STATUS )
	{
		GameState = tempByte;
		// Extract GameTime
		GameTime = buffy[7] + (buffy[8]<<8);

		if ( (GameState&0x03) == INST_STATUS_UPDATE )
		{
			// Check for WeaponState/Powerups/Penalties for ID
		}
		else if ( (GameState&0x03) == INST_TRANSPONDER_SETUP )
		{
			if ( packLen != 12 )
			{
				return ERROR_UNEXPECTED_DATA_LENGTH;
			}
			if ( fullLen != 19 )
			{
				return ERROR_UNEXPECTED_PACKET_LENGTH;
			}

			// Extract 8-bit transponderID
			if ( buffy[9] == 0 )
			{
				return ERROR_TRANSPONDER_ID_NULL;
			}
			TransponderID = repak[9];

			// Extract 24-bit transponderPacketCount
			tempLong = (buffy[10]<<0) + (buffy[11]<<8) + (buffy[12]<<16);
			if ( tempLong == 0 )
			{
				return ERROR_TRANSPONDER_COUNT_NULL;
			}
			TransponderPacketCount = tempLong;

			// Extract multicast address and port from response
			McastIP = { buffy[13], buffy[14], buffy[15], buffy[16] };
			McastPort = (buffy[17] + (buffy[18]<<8));

			return ERROR_NONE;
		}
		else if ( (GameState&0x03) == INST_START_OF_GAME )
		{
			// Get Team, HP, etc. of this transponder/bot
		}
		else
		{
			return ERROR_UNEXPECTED_INSTRUCTION;
		}





	}
	// Motion Packet
	else if ( buffy[0] == HEADER_MOTION )
	{
		if (tempByte != TransponderID )
		{
			return ERROR_ID_MISMATCH;
		}



	}
	// Passthrough Packet
	else if ( buffy[0] == HEADER_PASSTHRU )
	{
		if (tempByte != TransponderID )
		{
			return ERROR_ID_MISMATCH;
		}

	}
	else
	{
		return ERROR_UNKNOWN_HEADER_TYPE;
	}


	return ERROR_NONE;
}


}//namespace mechwarfare
