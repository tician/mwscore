

namespace mechwarfare
{

mwUDP::mwUDP()
{
	serverIP = {192, 168, 49, 13};
	serverPort = 0x1105;
	
	serverPacketCount = 0;
	transponderPacketCount = 0;
}

mwUDP::begin()
{
//	Serial.println("Starting UDP");
	udp.begin(localPort);
//	Serial.print("Local port: ");
//	Serial.println(udp.localPort());
}

uint8_t mwUDP::connect()
{
// Send initial configuration packet to server
	uint8_t pak[13] = {	0xF5, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,	// fixed header/IDs
						0x00, 0x00, 0x00, 0x00,						// ChipID
						0x00, 0x00};								// CRC
	// Get ChipID and send to server
	uint32_t chipID = getChipId();
	pak[7]  = (uint8_t) (chipID>>0)&0xFF;
	pak[8]  = (uint8_t) (chipID>>8)&0xFF;
	pak[9]  = (uint8_t) (chipID>>16)&0xFF;
	pak[10] = (uint8_t) (chipID>>24)&0xFF;

	uint16_t tempcrc = checker.crc(pak, 11, 0);
	pak[11] = (uint8_t) (tempcrc>>0)&0xFF;
	pak[12] = (uint8_t) (tempcrc>>8)&0xFF;

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
		return ERROR_UNEXPECTED_PACKET_SIZE;
	}

	if ( repak[0] != 0xF5 )
	{
		return ERROR_UNEXPECTED_HEADER;
	}

	uint8_t state = repak[4];
	if ( !(state&0x02) )
	{
		return ERROR_UNEXPECTED_INSTRUCTION;
	}

	uint16_t datLen = repak[7] + (repak[8]<<8);
	if ( datLen != 10 )
	{
		return ERROR_UNEXPECTED_DATA_LENGTH;
	}

	tempcrc = repak[19] + (repak[20]<<8);
	if ( tempcrc != checker.crc(repak, 19, 0) )
	{
		return ERROR_CRC_MISMATCH;
	}

// Extract 8-bit transponderID and 24-bit transponderPacketCount
	

// Extract multicast address and port from response
	

// Connect to multicast group
	udp.beginMulticast(WiFi.localIP(), mcastIP, mcastPort);

// Send multicast test request to server


// Wait for mcast packets or timeout
	resp = udp.parsePacket();
	while (!resp)
	{
//		Serial.println("No packet yet...");
		delay(5);
		resp = udp.parsePacket();
	}
}





}//namespace mechwarfare
