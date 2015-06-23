
#include "dynamixel.hpp"
namespace dynamixel
{
crc::crc(uint8_t *data, uint16_t len, uint16_t seed)
{
	uint8_t iter;
	uint16_t tempcrc = seed;

	for (iter=0; iter<len; iter++)
	{
		uint8_t index = (uint8_t) ((tempcrc >> 8)^data[iter]);//&0xFF;
		tempcrc = (uint16_t) ((tempcrc<<8) ^ crc_table[index]);
	}
}

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
dxl20::dxl20()
{
	setup(&Serial, 15);
}

dxl20::dxl20(HardwareSerial *ser, uint8_t txen)
{
	setup(ser, txen);
}

bool dxl20::setup(HardwareSerial *ser, uint8_t txen)
{
	dxl_uart = ser;
	if (dxl_uart==NULL)
		return false;

	pin_txen = txen;
	pinMode(pin_txen, OUTPUT);
	digitalWrite(pin_txen, LOW);	// TX-off, RX-on
	return true;
}

dxl20::~dxl20()
{
	end();
}


bool dxl20::begin(uint32_t baud)
{
	if (dxl_uart==NULL)
		return false;

	dxl_uart->begin(baud);
	return true;
}

bool dxl20::end()
{
	dxl_uart->end();
	return true;
}


uint16_t dxl20::getReg(uint8_t id, uint16_t regstart, uint16_t length, uint8_t *data)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (regstart>>0)&0xFF;
	params[1] = (uint8_t) (regstart>>8)&0xFF;
	params[2] = (uint8_t) (length>>0)&0xFF;
	params[3] = (uint8_t) (length>>8)&0xFF;
	uint16_t len = 4;
	uint8_t dxl_error = txrx(params, len, id, INST_READ, data);
	if (dxl_error==ERROR_NONE)
	{
//		data = params;
		return len;
	}
	else
	{
		data = NULL;
		return 0;
	}
}
uint8_t dxl20::getReg1(uint8_t id, uint16_t regstart)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (regstart>>0)&0xFF;
	params[1] = (uint8_t) (regstart>>8)&0xFF;
	params[2] = 1;
	params[3] = 0;
	uint16_t len = 4;
	uint8_t *data = NULL;
	uint8_t dxl_error = txrx(params, len, id, INST_READ, data);
	if (dxl_error==ERROR_NONE)
	{
		return data[0];
	}
	else
	{
		return 0xFF;//0x80;
	}
}
uint16_t dxl20::getReg2(uint8_t id, uint16_t regstart)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (regstart>>0)&0xFF;
	params[1] = (uint8_t) (regstart>>8)&0xFF;
	params[2] = 2;
	params[3] = 0;
	uint16_t len = 4;
	uint8_t *data = NULL;
	uint8_t dxl_error = txrx(params, len, id, INST_READ, data);
	if (dxl_error==ERROR_NONE)
	{
		return ( data[0] + (data[1]<<8) );
	}
	else
	{
		return 0xFFFF;//0x8000;
	}
}
uint32_t dxl20::getReg4(uint8_t id, uint16_t regstart)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (regstart>>0)&0xFF;
	params[1] = (uint8_t) (regstart>>8)&0xFF;
	params[2] = 4;
	params[3] = 0;
	uint16_t len = 4;
	uint8_t *data = NULL;
	uint8_t dxl_error = txrx(params, len, id, INST_READ, data);
	if (dxl_error==ERROR_NONE)
	{
		return ( data[0] + (data[1]<<8) + (data[2]<<16) + (data[3]<<24) );
	}
	else
	{
		return 0xFFFFFFFF;//0x80000000;
	}
}


uint16_t dxl20::putReg(uint8_t id, uint8_t *params, uint16_t length, uint8_t *error)
{
	uint8_t dxl_error = txrx(params, length, id, INST_WRITE, error);
	if (dxl_error==ERROR_NONE)
	{
		return len;
	}
	else
	{
		error = NULL;
		return 0;
	}
}
bool dxl20::putReg1(uint8_t id, uint16_t regstart, uint8_t data)
{
	uint8_t params[3] = {0, 0, 0};
	params[0] = (uint8_t) (regstart>>0)&0xFF;
	params[1] = (uint8_t) (regstart>>8)&0xFF;
	params[2] = data;

	uint8_t dxl_error = txrx(params, 3, id, INST_WRITE, NULL);
	if (dxl_error==ERROR_NONE)
		return true;
	else
		return false;
}
bool dxl20::putReg2(uint8_t id, uint16_t regstart, uint16_t data)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (regstart>>0)&0xFF;
	params[1] = (uint8_t) (regstart>>8)&0xFF;
	params[2] = (uint8_t) (data>>0)&0xFF;
	params[3] = (uint8_t) (data>>8)&0xFF;

	uint8_t dxl_error = txrx(params, 4, id, INST_WRITE, NULL);
	if (dxl_error==ERROR_NONE)
		return true;
	else
		return false;
}


bool dxl20::syncWrite(uint8_t *params, uint16_t length)
{
	uint8_t dxl_error = txrx(params, length, BROADCAST_ID, INST_SYNC_WRITE, NULL);
	if (dxl_error==ERROR_NONE)
		return true;
	else
		return false;
}


uint8_t dxl20::txrx(uint8_t *params, uint16_t &len, uint8_t id, uint8_t inst, uint8_t *returnData)
{
	if (params==NULL)
		return ERROR_INVALID_POINTER;
	if (returnData!=NULL)
		return ERROR_INVALID_POINTER;

// Header (4), ID (1), PacketLength (2), Inst(1), Param(len), CRC (2)
	uint16_t fullLen = 4+1+2+1+len+2;
	uint16_t packLen = 1 + len + 2;

	if (fullLen>DXL_BUFFER_SIZE)
	{
		// Buffer too small
		return ERROR_OUTPUT_BUFFER_OVERRUN;
	}

// Check 'inst' valid/supported
//	if (inst == INST_PING)


// Build TX packet
	buffy[0] = 0xFF;
	buffy[1] = 0xFF;
	buffy[2] = 0xFD;
	buffy[3] = 0x00;

	buffy[4] = id;
	buffy[5] = (uint8_t) (packLen>>0)&0xFF;
	buffy[6] = (uint8_t) (packLen>>8)&0xFF;
	buffy[7] = inst;
	// copy parameters
	memcpy(buffy+8, params, len);

	uint16_t tempcrc = checker.crc(buffy+4, len+4, 0x0E28);
	buffy[fullLen-2] = (uint8_t) (tempcrc>>0)&0xFF;
	buffy[fullLen-1] = (uint8_t) (tempcrc>>8)&0xFF;

	// flush input buffer
	while (dxl_uart->available())
	{
		dxl_uart->read();
	}

	digitalWrite(pin_txen, HIGH);	// TX-on, RX-off
	dxl_uart->write(buffy, fullLen);
	dxl_uart->flush();	// calls yield(), so might take too long with wifi stuff...
	//while(dxl_uart->availableForWrite()<0x80) { delayMicroseconds(50);}
	digitalWrite(pin_txen, LOW);	// TX-off, RX-on

	if ( (inst == INST_SYNC_WRITE) || ((id==BROADCAST_ID)&&(inst!=INST_PING)) )
		return ERROR_NONE;

	// clear buffer
	memset(buffy, 0, DXL_BUFFER_SIZE);
	len = 0;
	packLen = 0;
	fullLen = 0;

//	free(params);

// Handle RX 

	// wait for new data
	while (!dxl_uart->available())
	{
		delayMicroseconds(50);
	}

	// Drop new data until hit header
	// Grab at least 11 bytes (4 Head + 1 ID + 2 Length + 1 Inst + 1 Err + 2 CRC)
	// Check buffy[5] & buffy[6] for packet length
	// Adjust timeout counter for expected length
	// Check for buffer overrun

	uint32_t timeout_counter = micros() + 500;
	uint8_t iter=0;
	while (micros() < timeout_counter)
	{
		if (dxl_uart->available())
		{
			buffy[iter] = dxl_uart->read();
			if (iter>2)
			{
				iter++;
			}
			else if ( (iter==0) && (buffy[iter]==0xFF) )
			{
				iter++;
			}
			else if ( (iter==1) && (buffy[iter]==0xFF) )
			{
				iter++;
			}
			else if ( (iter==2) && (buffy[iter]==0xFD) )
			{
				iter++;
			}
			
			if (iter==7)
			{
				packLen = (buffy[5] + (buffy[6]<<8));
				timeout_counter += packLen*10;
				fullLen = (4+1+2 + packLen);
			}
			if (iter==fullLen)
			{
				// Received entire packet
				break;
			}
			if (iter==DXL_BUFFER_SIZE)
			{
				// Buffer full
				memset(buffy, 0, DXL_BUFFER_SIZE);
				return ERROR_INPUT_BUFFER_OVERRUN;
			}
		}
		else
		{
			delayMicroseconds(20);
		}
	}
	if (iter!=fullLen)
	{
		// Timeout
		memset(buffy, 0, DXL_BUFFER_SIZE);
		return ERROR_RX_TIMEOUT;
	}

	// Process Return Packet
	tempcrc = buffy[fullLen-2] + (buffy[fullLen-1]<<8);
	if ( tempcrc != checker.crc(buffy+4, 1+2+ packLen -2, 0x0E28) )
	{
		// CRC mismatch
		memset(buffy, 0, DXL_BUFFER_SIZE);
		return ERROR_CRC_MISMATCH;
	}

	if ( buffy[4] != id )
	{
		// ID mismatch
		memset(buffy, 0, DXL_BUFFER_SIZE);
		return ERROR_ID_MISMATCH;
	}

	if ( buffy[7] != INST_STATUS_RETURN )
	{
		// Received command packet from somewhere...
		// handleCommandPacket();
		memset(buffy, 0, DXL_BUFFER_SIZE);
		return ERROR_RECEIVED_COMMAND_PACKET
	}

	returnData = buffy[8]; //start at device error byte
	len = (-1+ packLen -2); // cut instruction and CRC bytes
	return ERROR_NONE;

}

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
dxl10::dxl10()
{
	setup(&Serial, 15);
}

dxl10::dxl10(HardwareSerial *ser, uint8_t txen)
{
	setup(ser, txen);
}

bool dxl10::setup(HardwareSerial *ser, uint8_t txen)
{
	dxl_uart = ser;
	if (dxl_uart==NULL)
		return false;

	pin_txen = txen;
	pinMode(pin_txen, OUTPUT);
	digitalWrite(pin_txen, LOW);	// TX-off, RX-on
	return true;
}

dxl10::~dxl10()
{
	end();
}


bool dxl10::begin(uint32_t baud)
{
	if (dxl_uart==NULL)
		return false;

	dxl_uart->begin(baud);
	return true;
}

bool dxl10::end()
{
	dxl_uart->end();
	return true;
}


uint8_t dxl10::getReg(uint8_t id, uint8_t regstart, uint8_t length, uint8_t *data)
{
	uint8_t params[2] = {0, 0};
	params[0] = regstart;
	params[1] = length;
	uint8_t len = 2;
	uint8_t dxl_error = txrx(params, len, id, INST_READ, data);
	if (dxl_error==ERROR_NONE)
	{
//		data = params;
		return len;
	}
	else
	{
		data = NULL;
		return 0;
	}
}
uint8_t dxl10::getReg1(uint8_t id, uint8_t regstart)
{
	uint8_t params[2] = {0, 0};
	params[0] = regstart;
	params[1] = 1;
	uint8_t len = 2;
	uint8_t *data = NULL;
	uint8_t dxl_error = txrx(params, len, id, INST_READ, data);
	if (dxl_error==ERROR_NONE)
	{
		return data[0];
	}
	else
	{
		return 0xFF;//0x80;
	}
}
uint16_t dxl10::getReg2(uint8_t id, uint8_t regstart)
{
	uint8_t params[2] = {0, 0};
	params[0] = regstart;
	params[1] = 2;
	uint8_t len = 2;
	uint8_t *data = NULL;
	uint8_t dxl_error = txrx(params, len, id, INST_READ, data);
	if (dxl_error==ERROR_NONE)
	{
		return ( data[0] + (data[1]<<8) );
	}
	else
	{
		return 0xFFFF;//0x8000;
	}
}
uint32_t dxl10::getReg4(uint8_t id, uint8_t regstart)
{
	uint8_t params[2] = {0, 0};
	params[0] = regstart;
	params[1] = 4;
	uint8_t len = 2;
	uint8_t *data = NULL;
	uint8_t dxl_error = txrx(params, len, id, INST_READ, data);
	if (dxl_error==ERROR_NONE)
	{
		return ( data[0] + (data[1]<<8) + (data[2]<<16) + (data[3]<<24) );
	}
	else
	{
		return 0xFFFFFFFF;//0x80000000;
	}
}


uint16_t dxl10::putReg(uint8_t id, uint8_t *params, uint8_t length, uint8_t *error)
{
	uint8_t dxl_error = txrx(params, length, id, INST_WRITE, error);
	if (dxl_error==ERROR_NONE)
	{
		return len;
	}
	else
	{
		error = NULL;
		return 0;
	}
}
bool dxl10::putReg1(uint8_t id, uint8_t regstart, uint8_t data)
{
	uint8_t params[2] = {0, 0};
	params[0] = regstart;
	params[1] = data;

	uint8_t dxl_error = txrx(params, 2, id, INST_WRITE, NULL);
	if (dxl_error==ERROR_NONE)
		return true;
	else
		return false;
}
bool dxl10::putReg2(uint8_t id, uint8_t regstart, uint16_t data)
{
	uint8_t params[3] = {0, 0, 0};
	params[0] = regstart;
	params[1] = (uint8_t) (data>>0)&0xFF;
	params[2] = (uint8_t) (data>>8)&0xFF;

	uint8_t dxl_error = txrx(params, 3, id, INST_WRITE, NULL);
	if (dxl_error==ERROR_NONE)
		return true;
	else
		return false;
}


bool dxl10::syncWrite(uint8_t *params, uint8_t length)
{
	uint8_t dxl_error = txrx(params, length, BROADCAST_ID, INST_SYNC_WRITE, NULL);
	if (dxl_error==ERROR_NONE)
		return true;
	else
		return false;
}


uint8_t dxl10::txrx(uint8_t *params, uint8_t &len, uint8_t id, uint8_t inst, uint8_t *returnData)
{
	if (params==NULL)
		return ERROR_INVALID_POINTER;
	if (returnData!=NULL)
		return ERROR_INVALID_POINTER;

// Header (2), ID (1), PacketLength (1), Inst(1), Param(len), Checksum (1)
	uint8_t fullLen = 2+1+1+1+len+1;
	uint8_t packLen = 1 + len + 1;

	if (fullLen>DXL_BUFFER_SIZE)
	{
		// Buffer too small
		return ERROR_OUTPUT_BUFFER_OVERRUN;
	}

// Check 'inst' valid/supported
//	if (inst == INST_PING)


// Build TX packet
	buffy[0] = 0xFF;
	buffy[1] = 0xFF;

	buffy[2] = id;
	buffy[3] = packLen;
	buffy[4] = inst;
	// copy parameters
	memcpy(buffy+5, params, len);

	uint8_t tempchecksum = checksum(buffy+2, len+3);
	buffy[fullLen-1] = tempchecksum;

	// flush input buffer
	while (dxl_uart->available())
	{
		dxl_uart->read();
	}

	digitalWrite(pin_txen, HIGH);	// TX-on, RX-off
	dxl_uart->write(buffy, fullLen);
	dxl_uart->flush();	// calls yield(), so might take too long with wifi stuff...
	//while(dxl_uart->availableForWrite()<0x80) { delayMicroseconds(50);}
	digitalWrite(pin_txen, LOW);	// TX-off, RX-on

	if ( (inst == INST_SYNC_WRITE) || ((id==BROADCAST_ID)&&(inst!=INST_PING)) )
		return ERROR_NONE;

	// clear buffer
	memset(buffy, 0, DXL_BUFFER_SIZE);
	len = 0;
	packLen = 0;
	fullLen = 0;

//	free(params);

// Handle RX 

	// wait for new data
	while (!dxl_uart->available())
	{
		delayMicroseconds(50);
	}

	// Drop new data until hit header
	// Grab at least 7 bytes (2 Head + 1 ID + 1 Length + 1 Inst + 1 Err + 1 Checksum)
	// Check buffy[3] for packet length
	// Adjust timeout counter for expected length
	// Check for buffer overrun

	uint32_t timeout_counter = micros() + 500;
	uint8_t iter=0;
	while (micros() < timeout_counter)
	{
		if (dxl_uart->available())
		{
			buffy[iter] = dxl_uart->read();
			if (iter>1)
			{
				iter++;
			}
			else if ( (iter==0) && (buffy[iter]==0xFF) )
			{
				iter++;
			}
			else if ( (iter==1) && (buffy[iter]==0xFF) )
			{
				iter++;
			}
			
			if (iter==4)
			{
				packLen = buffy[3];
				timeout_counter += packLen*10;
				fullLen = (2+1+1+ packLen);
			}
			if (iter==fullLen)
			{
				// Received entire packet
				break;
			}
			if (iter==DXL_BUFFER_SIZE)
			{
				// Buffer full
				memset(buffy, 0, DXL_BUFFER_SIZE);
				return ERROR_INPUT_BUFFER_OVERRUN;
			}
		}
		else
		{
			delayMicroseconds(20);
		}
	}
	if (iter!=fullLen)
	{
		// Timeout
		memset(buffy, 0, DXL_BUFFER_SIZE);
		return ERROR_RX_TIMEOUT;
	}

	// Process Return Packet
	tempchecksum = buffy[fullLen-1];
	if ( tempchecksum != checksum(buffy+2, 1+1+ packLen -1) )
	{
		// CRC/Checksum mismatch
		memset(buffy, 0, DXL_BUFFER_SIZE);
		return ERROR_CRC_MISMATCH;
	}

	if ( buffy[2] != id )
	{
		// ID mismatch
		memset(buffy, 0, DXL_BUFFER_SIZE);
		return ERROR_ID_MISMATCH;
	}

//	if ( buffy[7] != INST_STATUS_RETURN )
//	{
//		// Received command packet from somewhere...
//		// handleCommandPacket();
//		memset(buffy, 0, DXL_BUFFER_SIZE);
//		return ERROR_RECEIVED_COMMAND_PACKET
//	}

	returnData = buffy[4]; //start at device error byte
	len = (packLen -1); // cut checksum byte
	return ERROR_NONE;
}

uint8_t dxl10::checksum(uint8_t *data, uint8_t len)
{
	uint16_t temp = 0;
	uint8_t iter;
	for (iter=0; iter<len; iter++)
	{
		temp += data[iter];
	}
	
	return (uint8_t) ~(temp&0xFF);
}


} //namespace dynamixel
