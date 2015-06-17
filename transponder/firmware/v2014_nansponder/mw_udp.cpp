

namespace mechwarfare
{

mwUDP::mwUDP()
{
	ServerIP = {192, 168, 49, 13};
	ServerPort = 0x1105;
	
	ServerPacketCount = 0;
	TransponderPacketCount = 0;
	TransponderID = 0;
	ChipID = getChipId();
}

mwUDP::begin()
{
//	Serial.println("Starting UDP");
	udp.begin(LocalPort);
//	Serial.print("Local port: ");
//	Serial.println(udp.localPort());
}

uint8_t mwUDP::connect(IPAddress ip, uint16_t port)
{
	ServerIP = ip;
	ServerPort = port;
	return connect();
}

uint8_t mwUDP::connect()
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

uint8_t mwUDP::pushTransponderUpdate()
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
}

uint8_t mwUDP::handleServerPacket(uint8_t timeout)
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

uint8_t mwUDP::handleMulticast()
{
	// clear buffer
	memset(buffy, 0, MWUDP_BUFFER_SIZE);

	uint8_t tempByte = 0;
	uint16_t tempShort = 0;
	uint32_t tempLong = 0;

	// Grab packet to big buffer
	int packLen = 0;
	int fullLen = udp.available();
	if ( fullLen < MWUDP_BUFFER_SIZE )
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


}

uint8_t mwUDP::handleUnicast()
{
	// clear buffer
	memset(buffy, 0, MWUDP_BUFFER_SIZE);

	uint8_t tempByte = 0;
	uint16_t tempShort = 0;
	uint32_t tempLong = 0;

	// Grab packet to big buffer
	int packLen = 0;
	int fullLen = udp.available();
	if ( fullLen < MWUDP_BUFFER_SIZE )
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
			// Just trigger new update packet to server?
			// Nope, have to check for WeaponState/Powerups/Penalties for ID
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
		}else
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
