/*
 *******************************************************************************
 * DXL1.0/DXL2.0 library for Arduino HardwareSerial
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
 
#include "dynamixel.hpp"
namespace dynamixel
{
crc::crc(uint8_t *data, uint16_t len, uint16_t seed)
{
	uint8_t iter;
	uint16_t temp_crc = seed;

	for (iter=0; iter<len; iter++)
	{
		uint8_t index = (uint8_t) ((temp_crc >> 8)^data[iter]);//&0xFF;
		temp_crc = (uint16_t) ((temp_crc<<8) ^ crc_table_[index]);
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
	dxl_uart_ = ser;
	if (dxl_uart_==NULL)
		return false;

	pin_txen_ = txen;
	pinMode(pin_txen_, OUTPUT);
	digitalWrite(pin_txen_, LOW);	// TX-off, RX-on
	return true;
}

dxl20::~dxl20()
{
	end();
}


bool dxl20::begin(uint32_t baud)
{
	if (dxl_uart_==NULL)
		return false;

	other_dxl_.purge();
	dxl_uart_->begin(baud);
	us_per_byte_ = (uint32_t) (1000000*12)/baud;
	return true;
}

bool dxl20::end()
{
	dxl_uart_->end();
	return true;
}


uint16_t dxl20::getReg(uint8_t id, uint16_t reg_start, uint16_t length, uint8_t *data)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (reg_start>>0)&0xFF;
	params[1] = (uint8_t) (reg_start>>8)&0xFF;
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
uint8_t dxl20::getReg1(uint8_t id, uint16_t reg_start)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (reg_start>>0)&0xFF;
	params[1] = (uint8_t) (reg_start>>8)&0xFF;
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
uint16_t dxl20::getReg2(uint8_t id, uint16_t reg_start)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (reg_start>>0)&0xFF;
	params[1] = (uint8_t) (reg_start>>8)&0xFF;
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
uint32_t dxl20::getReg4(uint8_t id, uint16_t reg_start)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (reg_start>>0)&0xFF;
	params[1] = (uint8_t) (reg_start>>8)&0xFF;
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
bool dxl20::putReg1(uint8_t id, uint16_t reg_start, uint8_t data)
{
	uint8_t params[3] = {0, 0, 0};
	params[0] = (uint8_t) (reg_start>>0)&0xFF;
	params[1] = (uint8_t) (reg_start>>8)&0xFF;
	params[2] = data;

	uint8_t dxl_error = txrx(params, 3, id, INST_WRITE, NULL);
	if (dxl_error==ERROR_NONE)
		return true;
	else
		return false;
}
bool dxl20::putReg2(uint8_t id, uint16_t reg_start, uint16_t data)
{
	uint8_t params[4] = {0, 0, 0, 0};
	params[0] = (uint8_t) (reg_start>>0)&0xFF;
	params[1] = (uint8_t) (reg_start>>8)&0xFF;
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


uint8_t dxl20::txrx(uint8_t *params, uint16_t &len, uint8_t id, uint8_t inst, uint8_t *return_data)
{
	if (params==NULL)
		return ERROR_INVALID_POINTER;
	if (return_data!=NULL)
		return ERROR_INVALID_POINTER;

// Header (4), ID (1), PacketLength (2), Inst(1), Param(len), CRC (2)
	uint16_t len_full = 4+1+2+1+len+2;
	uint16_t len_packet = 1 + len + 2;

	if (len_full>DXL_BUFFER_SIZE)
	{
		// Buffer too small
		return ERROR_OUTPUT_BUFFER_OVERRUN;
	}

// Check 'inst' valid/supported
//	if (inst == INST_PING)


// Build TX packet
	buffy_[0] = 0xFF;
	buffy_[1] = 0xFF;
	buffy_[2] = 0xFD;
	buffy_[3] = 0x00;

	buffy_[4] = id;
	buffy_[5] = (uint8_t) (len_packet>>0)&0xFF;
	buffy_[6] = (uint8_t) (len_packet>>8)&0xFF;
	buffy_[7] = inst;
	// copy parameters
	memcpy(buffy_+8, params, len);

	uint16_t temp_crc = checker_.crc(buffy_+4, len+4, 0x0E28);
	buffy_[len_full-2] = (uint8_t) (temp_crc>>0)&0xFF;
	buffy_[len_full-1] = (uint8_t) (temp_crc>>8)&0xFF;

	// flush input buffer
	while (dxl_uart_->available())
	{
		dxl_uart_->read();
	}

	digitalWrite(pin_txen_, HIGH);	// TX-on, RX-off
	dxl_uart_->write(buffy_, len_full);
	dxl_uart_->flush();	// calls yield(), so might take too long with wifi stuff...
	//while(dxl_uart_->availableForWrite()<0x80) { delayMicroseconds(50);}
	digitalWrite(pin_txen_, LOW);	// TX-off, RX-on

	if ( (inst == INST_SYNC_WRITE) || ((id==BROADCAST_ID)&&(inst!=INST_PING)) )
		return ERROR_NONE;

	// clear buffer
	memset(buffy_, 0, DXL_BUFFER_SIZE);
	len = 0;
	len_packet = 0;
	len_full = 0;

//	free(params);

// Handle RX 

	// wait for new data
	while (!dxl_uart_->available())
	{
		delayMicroseconds(50);
	}

	// Drop new data until hit header
	// Grab at least 11 bytes (4 Head + 1 ID + 2 Length + 1 Inst + 1 Err + 2 CRC)
	// Check buffy_[5] & buffy_[6] for packet length
	// Adjust timeout counter for expected length
	// Check for buffer overrun

	uint32_t timeout_counter = micros() + 500;
	uint8_t iter=0;
	while (micros() < timeout_counter)
	{
		if (dxl_uart_->available())
		{
			buffy_[iter] = dxl_uart_->read();
			if (iter>2)
			{
				iter++;
			}
			else if ( (iter==0) && (buffy_[iter]==0xFF) )
			{
				iter++;
			}
			else if ( (iter==1) && (buffy_[iter]==0xFF) )
			{
				iter++;
			}
			else if ( (iter==2) && (buffy_[iter]==0xFD) )
			{
				iter++;
			}
			
			if (iter==7)
			{
				len_packet = (buffy_[5] + (buffy_[6]<<8));
				timeout_counter += len_packet*us_per_byte_;
				len_full = (4+1+2 + len_packet);
			}
			if (iter==len_full)
			{
				// Received entire packet
				break;
			}
			if (iter==DXL_BUFFER_SIZE)
			{
				// Buffer full
				memset(buffy_, 0, DXL_BUFFER_SIZE);
				return ERROR_INPUT_BUFFER_OVERRUN;
			}
		}
		else
		{
			delayMicroseconds(20);
		}
	}
	if (iter!=len_full)
	{
		// Timeout
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_RX_TIMEOUT;
	}

	// Process Return Packet
	temp_crc = buffy_[len_full-2] + (buffy_[len_full-1]<<8);
	if ( temp_crc != checker_.crc(buffy_+4, 1+2+ len_packet -2, 0x0E28) )
	{
		// CRC mismatch
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_CRC_MISMATCH;
	}

	if ( buffy_[4] != id )
	{
		// ID mismatch
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_ID_MISMATCH;
	}

	if ( buffy_[7] != INST_STATUS_RETURN )
	{
		// Received command packet from somewhere...
		// handleCommandPacket();
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_RECEIVED_COMMAND_PACKET
	}

	return_data = buffy_[8]; //start at device error byte
	len = (-1+ len_packet -2); // cut instruction and CRC bytes
	return ERROR_NONE;

}




uint8_t dxl20::rxtx(uint32_t timeout_to_message)
{
// PROCESS MESSAGE FROM CONTROLLER
	uint32_t timeout_counter = micros() + timeout_to_message;
	// wait for new data
	while (!dxl_uart_->available())
	{
		delayMicroseconds(50);
		if (micros()>timeout_counter)
		{
			return ERROR_RX_TIMEOUT;
		}
	}

// Header (4), ID (1), PacketLength (2), Inst(1), Param(len), CRC (2)
	uint16_t len_full = 0;
	uint16_t len_packet = 0;

	// Drop new data until hit header
	// Grab at least 11 bytes (4 Head + 1 ID + 2 Length + 1 Inst + 1 Err + 2 CRC)
	// Check buffy_[5] & buffy_[6] for packet length
	// Adjust timeout counter for expected length
	// Check for buffer overrun

	timeout_counter = micros() + 500;
	uint8_t iter=0;
	while (micros() < timeout_counter)
	{
		if (dxl_uart_->available())
		{
			buffy_[iter] = dxl_uart_->read();
			if (iter>2)
			{
				iter++;
			}
			else if ( (iter==0) && (buffy_[iter]==0xFF) )
			{
				iter++;
			}
			else if ( (iter==1) && (buffy_[iter]==0xFF) )
			{
				iter++;
			}
			else if ( (iter==2) && (buffy_[iter]==0xFD) )
			{
				iter++;
			}
			
			if (iter==7)
			{
				len_packet = (buffy_[5] + (buffy_[6]<<8));
				timeout_counter += len_packet*us_per_byte_;
				len_full = (4+1+2 + len_packet);
			}
			if (iter==len_full)
			{
				// Received entire packet
				break;
			}
			if (iter==DXL_BUFFER_SIZE)
			{
				// Buffer full
				memset(buffy_, 0, DXL_BUFFER_SIZE);
				return ERROR_INPUT_BUFFER_OVERRUN;
			}
		}
		else
		{
			delayMicroseconds(20);
		}
	}
	if (iter!=len_full)
	{
		// Timeout
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_RX_TIMEOUT;
	}

	// Process Command Packet
	temp_crc = buffy_[len_full-2] + (buffy_[len_full-1]<<8);
	if ( temp_crc != checker_.crc(buffy_+4, 1+2+ len_packet -2, 0x0E28) )
	{
		// CRC mismatch
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_CRC_MISMATCH;
	}

/*
	if ( buffy_[4] != device_id )
	{
		// ID mismatch
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_ID_MISMATCH;
	}

	if ( buffy_[7] != INST_STATUS_RETURN )
	{
		// Received command packet from somewhere...
		// handleCommandPacket();
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_RECEIVED_COMMAND_PACKET
	}

	return_data = buffy_[8]; //start at device error byte
	len = (-1+ len_packet -2); // cut instruction and CRC bytes
	return ERROR_NONE;
*/

/// HANDLE MESSAGE CONTENT
	// Message intended for this dxl device
	if ( buffy_[4] == device_id )
	{
		
	}
	// Message may have component intended for this dxl device
	else if ( (buffy_[4] == BROADCAST_ID) && (other_dxl_.num==0) )
	{
		// Just a dxl device
		
	}
	// Message may have component intended for this dxl device
	else if ( (buffy_[4] == BROADCAST_ID) && (other_dxl_.num>0) )
	{
		// Process and/or pass-through packet for other dxl interface(s)
		uint8_t buffy2[DXL_BUFFER_SIZE];
		memset(buffy2, 0, DXL_BUFFER_SIZE);

		if ( buffy_[7] == INST_AX_SYNC_READ )
		{
			// Process AX psuedo SYNC_READ (READ all)
			
		}
		else if ( buffy_[7] == INST_AX_BULK_READ )
		{
			// Process AX psuedo BULK_READ (READ all)
			
		}
		else if ( buffy_[7] == INST_AX_BULK_WRITE )
		{
			// Process AX psuedo BULK_WRITE (WRITE all)
			
		}
		else if ( buffy_[7] == INST_MIXED_SYNC_READ )
		{
			// Process AX psuedo SYNC_READ mixed with MX servos
			// Try SYNC_READ and do plain READ for all that do not respond?
			// Not sure MX servos will continue packet if previous servo 
			//  did not provide its part of the packet (lost/missing).
			// If don't complete packet, force user to split MX and AX/RX/EX
			//  IDs: MX servos until ID==0 (SYNC_READ with new checksum),
			//  then AX servos after (READ);
			
		}
		else if ( buffy_[7] == INST_MIXED_BULK_READ )
		{
			// Process AX psuedo BULK_READ mixed with MX servos
			
		}
		else if ( buffy_[7] == INST_MIXED_BULK_WRITE )
		{
			// Process AX psuedo BULK_WRITE mixed with MX servos
			
		}
		else
		{
			// Otherwise simple pass-through while still checking
			//  for anything intended for this dxl device
			bool make_dxl10_packet = false;
			iter = 0;
			for (iter=0; iter<other_dxl_.num; iter++)
			{
				if (other_dxl_.dev[iter].ver == 1)
				{
					make_dxl10_packet = true;
					break;
				}
			}
			if (make_dxl10_packet)
			{
				// Convert dxl20 to dxl10 packet
//				buffy3[]
			}

			for (iter=0; iter<other_dxl_.num; iter++)
			{
				if (other_dxl_.dev[iter].ver == 1)
				{
					// Transfer dxl10 packet
//					memset(buffy2, 0, DXL_BUFFER_SIZE);

//					other_dxl_.dev[iter].ser->txrx(buffy3, len_packet-2, buffy_[4], buffy_[7], buffy2);
//					dxl_uart_->write(buffy2, 2+1+1+buffy2[3]); // dx1.0 reply?
				}
				else if (other_dxl_.dev[iter].ver == 2)
				{
					// Transfer dxl20 packet
//					memset(buffy2, 0, DXL_BUFFER_SIZE);
//					other_dxl_.dev[iter].ser->txrx(buffy2+8, len_packet-2, buffy_[4], buffy_[7], buffy2);
//					dxl_uart_->write(buffy2, 2+1+1+buffy2[3]);
				}
			}
		}
	}
	else
	{
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_ID_MISMATCH;
	}
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
	dxl_uart_ = ser;
	if (dxl_uart_==NULL)
		return false;

	pin_txen_ = txen;
	pinMode(pin_txen_, OUTPUT);
	digitalWrite(pin_txen_, LOW);	// TX-off, RX-on
	return true;
}

dxl10::~dxl10()
{
	end();
}


bool dxl10::begin(uint32_t baud)
{
	if (dxl_uart_==NULL)
		return false;

	dxl_uart_->begin(baud);
	us_per_byte_ = (uint32_t) (1000000*12)/baud;
	return true;
}

bool dxl10::end()
{
	dxl_uart_->end();
	return true;
}


uint8_t dxl10::getReg(uint8_t id, uint8_t reg_start, uint8_t length, uint8_t *data)
{
	uint8_t params[2] = {0, 0};
	params[0] = reg_start;
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
uint8_t dxl10::getReg1(uint8_t id, uint8_t reg_start)
{
	uint8_t params[2] = {0, 0};
	params[0] = reg_start;
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
uint16_t dxl10::getReg2(uint8_t id, uint8_t reg_start)
{
	uint8_t params[2] = {0, 0};
	params[0] = reg_start;
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
uint32_t dxl10::getReg4(uint8_t id, uint8_t reg_start)
{
	uint8_t params[2] = {0, 0};
	params[0] = reg_start;
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
bool dxl10::putReg1(uint8_t id, uint8_t reg_start, uint8_t data)
{
	uint8_t params[2] = {0, 0};
	params[0] = reg_start;
	params[1] = data;

	uint8_t dxl_error = txrx(params, 2, id, INST_WRITE, NULL);
	if (dxl_error==ERROR_NONE)
		return true;
	else
		return false;
}
bool dxl10::putReg2(uint8_t id, uint8_t reg_start, uint16_t data)
{
	uint8_t params[3] = {0, 0, 0};
	params[0] = reg_start;
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


uint8_t dxl10::txrx(uint8_t *params, uint8_t &len, uint8_t id, uint8_t inst, uint8_t *return_data)
{
	if (params==NULL)
		return ERROR_INVALID_POINTER;
	if (return_data!=NULL)
		return ERROR_INVALID_POINTER;

// Header (2), ID (1), PacketLength (1), Inst(1), Param(len), Checksum (1)
	uint8_t len_full = 2+1+1+1+len+1;
	uint8_t len_packet = 1 + len + 1;

	if (len_full>DXL_BUFFER_SIZE)
	{
		// Buffer too small
		return ERROR_OUTPUT_BUFFER_OVERRUN;
	}

// Check 'inst' valid/supported
//	if (inst == INST_PING)


// Build TX packet
	buffy_[0] = 0xFF;
	buffy_[1] = 0xFF;

	buffy_[2] = id;
	buffy_[3] = len_packet;
	buffy_[4] = inst;
	// copy parameters
	memcpy(buffy_+5, params, len);

	uint8_t tempchecksum = checksum(buffy_+2, len+3);
	buffy_[len_full-1] = tempchecksum;

	// flush input buffer
	while (dxl_uart_->available())
	{
		dxl_uart_->read();
	}

	digitalWrite(pin_txen_, HIGH);	// TX-on, RX-off
	dxl_uart_->write(buffy_, len_full);
	dxl_uart_->flush();	// calls yield(), so might take too long with wifi stuff...
	//while(dxl_uart_->availableForWrite()<0x80) { delayMicroseconds(50);}
	digitalWrite(pin_txen_, LOW);	// TX-off, RX-on

	if ( (inst == INST_SYNC_WRITE) || ((id==BROADCAST_ID)&&(inst!=INST_PING)) )
		return ERROR_NONE;

	// clear buffer
	memset(buffy_, 0, DXL_BUFFER_SIZE);
	len = 0;
	len_packet = 0;
	len_full = 0;

//	free(params);

// Handle RX 

	// wait for new data
	while (!dxl_uart_->available())
	{
		delayMicroseconds(50);
	}

	// Drop new data until hit header
	// Grab at least 7 bytes (2 Head + 1 ID + 1 Length + 1 Inst + 1 Err + 1 Checksum)
	// Check buffy_[3] for packet length
	// Adjust timeout counter for expected length
	// Check for buffer overrun

	uint32_t timeout_counter = micros() + 500;
	uint8_t iter=0;
	while (micros() < timeout_counter)
	{
		if (dxl_uart_->available())
		{
			buffy_[iter] = dxl_uart_->read();
			if (iter>1)
			{
				iter++;
			}
			else if ( (iter==0) && (buffy_[iter]==0xFF) )
			{
				iter++;
			}
			else if ( (iter==1) && (buffy_[iter]==0xFF) )
			{
				iter++;
			}
			
			if (iter==4)
			{
				len_packet = buffy_[3];
				timeout_counter += len_packet*us_per_byte_;
				len_full = (2+1+1+ len_packet);
			}
			if (iter==len_full)
			{
				// Received entire packet
				break;
			}
			if (iter==DXL_BUFFER_SIZE)
			{
				// Buffer full
				memset(buffy_, 0, DXL_BUFFER_SIZE);
				return ERROR_INPUT_BUFFER_OVERRUN;
			}
		}
		else
		{
			delayMicroseconds(20);
		}
	}
	if (iter!=len_full)
	{
		// Timeout
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_RX_TIMEOUT;
	}

	// Process Return Packet
	tempchecksum = buffy_[len_full-1];
	if ( tempchecksum != checksum(buffy_+2, 1+1+ len_packet -1) )
	{
		// CRC/Checksum mismatch
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_CRC_MISMATCH;
	}

	if ( buffy_[2] != id )
	{
		// ID mismatch
		memset(buffy_, 0, DXL_BUFFER_SIZE);
		return ERROR_ID_MISMATCH;
	}

//	if ( buffy_[7] != INST_STATUS_RETURN )
//	{
//		// Received command packet from somewhere...
//		// handleCommandPacket();
//		memset(buffy_, 0, DXL_BUFFER_SIZE);
//		return ERROR_RECEIVED_COMMAND_PACKET
//	}

	return_data = buffy_[4]; //start at device error byte
	len = (len_packet -1); // cut checksum byte
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
