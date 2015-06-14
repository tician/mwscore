

namespace mechwarfare
{

mwUDP::mwUDP()
{
	serverIP = (192, 168, 49, 13);
	serverPort = 0x1105;
	
	serverPacketCount = 0;
	transponderPacketCount = 0;
	transponderID = 0;
	chipID = getChipId();
}

mwUDP::begin()
{
//	Serial.println("Starting UDP");
	udp.begin(localPort);
//	Serial.print("Local port: ");
//	Serial.println(udp.localPort());
}

uint8_t mwUDP::connect(IPAddress ip, uint16_t port)
{
	serverIP = ip;
	serverPort = port;
	return connect();
}

uint8_t mwUDP::connect()
{
	uint8_t tempByte = 0;
	uint16_t tempShort = 0;
	uint32_t tempLong = 0;

// Send initial configuration packet to server
	uint8_t pak[13] = {	0xF0, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,	// fixed header/IDs
						0x00, 0x00, 0x00, 0x00,						// ChipID
						0x00, 0x00};								// CRC
	// Get ChipID and send to server
	pak[7]  = (uint8_t) (chipID>>0)&0xFF;
	pak[8]  = (uint8_t) (chipID>>8)&0xFF;
	pak[9]  = (uint8_t) (chipID>>16)&0xFF;
	pak[10] = (uint8_t) (chipID>>24)&0xFF;

	tempShort = checker.crc(pak, 11, 0);
	pak[11] = (uint8_t) (tempShort>>0)&0xFF;
	pak[12] = (uint8_t) (tempShort>>8)&0xFF;

	udp.beginPacket(serverIP, serverPort);
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

// Verify response
	uint8_t repak[32] = {0};
	if ( resp == 21 )
	{
		udp.read(repak, 21);
	}
	else
	{
		udp.flush();
		return ERROR_UNEXPECTED_PACKET_SIZE;
	}

// Check packet header/type
	if ( repak[0] != 0xF5 )
	{
		return ERROR_UNEXPECTED_HEADER;
	}

// Extract GameState and Instruction
	tempByte = repak[4];
	if ( (tempByte&0x03) != INST_TRANSPONDER_SETUP )
	{
		return ERROR_UNEXPECTED_INSTRUCTION;
	}
	gameState = tempByte;

// Extract Data Length
	tempShort = repak[7] + (repak[8]<<8);
	if ( tempShort != 10 )
	{
		return ERROR_UNEXPECTED_DATA_LENGTH;
	}

// Extract CRC and verify
	tempShort = repak[19] + (repak[20]<<8);
	if ( tempShort != checker.crc(repak, 19, 0) )
	{
		return ERROR_CRC_MISMATCH;
	}

// Extract 24-bit serverPacketCount
	tempLong = (repak[1]<<0) + (repak[2]<<8) + (repak[3]<<16);
	if ( tempLong == 0 )
	{
		return ERROR_SERVER_COUNT_NULL;
	}
	serverPacketCount = tempLong;

// Extract GameTime
	gameTime = repak[5] + (repak[6]<<8);

// Extract 8-bit transponderID
	if ( repak[9] == 0 )
	{
		return ERROR_TRANSPONDER_ID_NULL;
	}
	transponderID = repak[9];

// Extract 24-bit transponderPacketCount
	tempLong = (repak[10]<<0) + (repak[11]<<8) + (repak[12]<<16);
	if ( tempLong == 0 )
	{
		return ERROR_TRANSPONDER_COUNT_NULL;
	}
	transponderPacketCount = tempLong;

// Extract multicast address and port from response
	mcastIP = ( repak[13], repak[14], repak[15], repak[16] );
	mcastPort = (repak[17] + (repak[18]<<8));

// Connect to multicast group
	udp.beginMulticast(WiFi.localIP(), mcastIP, mcastPort);

// Send multicast test request to server
	pak[0] = 0xF0;
	pak[1] = (uint8_t) (transponderPacketCount>>0)&0xFF;
	pak[2] = (uint8_t) (transponderPacketCount>>8)&0xFF;
	pak[3] = (uint8_t) (transponderPacketCount>>16)&0xFF;
	pak[4] = transponderID;
	pak[5] = 0x04;
	pak[6] = 0x00;
	pak[7]  = (uint8_t) (chipID>>0)&0xFF;
	pak[8]  = (uint8_t) (chipID>>8)&0xFF;
	pak[9]  = (uint8_t) (chipID>>16)&0xFF;
	pak[10] = (uint8_t) (chipID>>24)&0xFF;

	tempShort = checker.crc(pak, 11, 0);
	pak[11] = (uint8_t) (tempShort>>0)&0xFF;
	pak[12] = (uint8_t) (tempShort>>8)&0xFF;

	udp.beginPacket(serverIP, serverPort);
	udp.write(pak, 13);
	udp.endPacket();
	transponderPacketCount++;

	tempByte = ERROR_RECEIVED_NO_PACKET;
	tempShort = 0;
	while ( (tempByte != ERROR_NONE) && (tempShort < 10) )
	{
		tempByte = handleServerPacket(20);
		tempShort++;
	}
	if (tempByte != ERROR_NONE)
	{
		return ERROR_MULTICAST_TEST_FAILED;
	}



	return ERROR_NONE;
}

uint8_t mwUDP::handleServerPacket(uint8_t timeout)
{
// Wait for mcast packets or timeout
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

	if (udp.destinationIP() == mcastIP)
	{
		return parseMulticast();
//		return ERROR_NONE;
	}
	else if (udp.destinationIP() == WiFi.localIP())
	{
		return parseUnicast();
//		return ERROR_NONE;
	}
	else
	{
		udp.flush();
		return ERROR_UNKNOWN_DESTINATION_IP;
	}
}

uint8_t mwUDP::pushTransponderUpdate()
{
	uint16_t tempShort = 0;
	uint8_t pak[11];

	// Send HP/WeaponState update to server
	pak[0] = 0xF5;
	pak[1] = (uint8_t) (transponderPacketCount>>0)&0xFF;
	pak[2] = (uint8_t) (transponderPacketCount>>8)&0xFF;
	pak[3] = (uint8_t) (transponderPacketCount>>16)&0xFF;
	pak[4] = transponderID;
	pak[5] = 0x02;
	pak[6] = 0x00;
	pak[7]  = (uint8_t) (myState>>0)&0xFF;
	pak[8]  = (uint8_t) (myState>>8)&0xFF;//0x8F; // ignore Flag and Capturing?

	tempShort = checker.crc(pak, 9, 0);
	pak[9] = (uint8_t) (tempShort>>0)&0xFF;
	pak[10] = (uint8_t) (tempShort>>8)&0xFF;

	udp.beginPacket(serverIP, serverPort);
	udp.write(pak, 11);
	udp.endPacket();
	transponderPacketCount++;
}

uint8_t mwUDP::parseMulticast()
{
	
}

uint8_t mwUDP::parseUnicast()
{
	uint8_t tempByte = udp.read();

	// Status Packet
	if (tempByte == 0xF5)
	{
		
	}
	// Motion Packet
	else if (tempByte == 0xFA)
	{
		
	}
	// Passthrough Packet
	else if (tempByte == 0xFD)
	{
		
	}

	uint8_t pak[16];
	int resp = udp.available();
	if (resp <= 16)
		udp.read(pak, resp);
	else
		udp.read(pak, 9);


}


}//namespace mechwarfare
