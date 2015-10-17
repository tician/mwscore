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

#ifndef _DXL_DUAL_H_
#define _DXL_DUAL_H_


#include "dxl_devices.h"
namespace dynamixel
{

#ifndef BROADCAST_ID
#define BROADCAST_ID					254
#endif

#ifndef INST_PING
#define INST_PING						0x01
#endif
#ifndef INST_READ
#define INST_READ						0x02
#endif
#ifndef INST_WRITE
#define INST_WRITE						0x03
#endif
#ifndef INST_REG_WRITE
#define INST_REG_WRITE					0x04
#endif
#ifndef INST_ACTION
#define INST_ACTION						0x05
#endif
#ifndef INST_FACTORY_RESET
#define INST_FACTORY_RESET				0x06
#endif
#ifndef INST_DIGITAL_RESET
#define INST_DIGITAL_RESET				0x07
#endif
#ifndef INST_REBOOT
#define INST_REBOOT						0x08
#endif
#ifndef INST_SYSTEM_READ
#define INST_SYSTEM_READ				0x0C
#endif
#ifndef INST_SYSTEM_WRITE
#define INST_SYSTEM_WRITE				0x0D
#endif
#ifndef INST_STATUS_RETURN
#define INST_STATUS_RETURN				0x55
#endif

#ifndef INST_SYNC_READ
#define INST_SYNC_READ					0x82
#endif
#ifndef INST_SYNC_WRITE
#define INST_SYNC_WRITE					0x83
#endif
#ifndef INST_SYNC_REG_WRITE
#define INST_SYNC_REG_WRITE				0x84
#endif
#ifndef INST_BULK_READ
#define INST_BULK_READ					0x92
#endif
#ifndef INST_BULK_WRITE
#define INST_BULK_WRITE					0x93
#endif

#ifndef INST_AX_SYNC_READ
#define INST_AX_SYNC_READ				0xC2
#endif
#ifndef INST_AX_BULK_READ
#define INST_AX_BULK_READ				0xD2
#endif
#ifndef INST_AX_BULK_WRITE
#define INST_AX_BULK_WRITE				0xD3
#endif
#ifndef INST_MIXED_SYNC_READ
#define INST_MIXED_SYNC_READ			0xCA
#endif
#ifndef INST_MIXED_BULK_READ
#define INST_MIXED_BULK_READ			0xDA
#endif
#ifndef INST_MIXED_BULK_WRITE
#define INST_MIXED_BULK_WRITE			0xDB
#endif


#ifndef ERRBIT_VOLTAGE
#define ERRBIT_VOLTAGE					(1)
#endif
#ifndef ERRBIT_ANGLE
#define ERRBIT_ANGLE					(2)
#endif
#ifndef ERRBIT_OVERHEAT
#define ERRBIT_OVERHEAT					(4)
#endif
#ifndef ERRBIT_RANGE
#define ERRBIT_RANGE					(8)
#endif
#ifndef ERRBIT_CHECKSUM
#define ERRBIT_CHECKSUM					(16)
#endif
#ifndef ERRBIT_OVERLOAD
#define ERRBIT_OVERLOAD					(32)
#endif
#ifndef ERRBIT_INSTRUCTION
#define ERRBIT_INSTRUCTION				(64)
#endif

#define DXL_BUFFER_SIZE					128

	enum
	{
		ERROR_NONE,
		ERROR_INVALID_POINTER,
		ERROR_OUTPUT_BUFFER_OVERRUN,
		ERROR_INPUT_BUFFER_OVERRUN,
		ERROR_RX_TIMEOUT,
		ERROR_CRC_MISMATCH,
		ERROR_ID_MISMATCH,
		ERROR_RECEIVED_COMMAND_PACKET
	};

	class crc
	{
	private:
		static uint16_t crc_table_[256] = {
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

	public:
		uint16_t crc(uint8_t *data, uint16_t len, uint16_t seed);
		uint16_t crc(uint8_t *data, uint16_t len) { crc(data,len,0); }
	};



	class dxl_def
	{
	public:
		struct interface
		{
			HardwareSerial* ser;
			uint8_t ver;
		};

		uint8_t num;
		interface dev[4];

		bool add(HardwareSerial* hardware_serial, uint8_t dynamixel_version)
		{
			if (num >= 4)
				return false;
			num++;
			dev[num-1].ser = hardware_serial;
			dev[num-1].ver = dynamixel_version;
		}
		bool purge(void)
		{
			uint8_t iter;
			for (iter=0; iter<4; iter++)
			{
				num = 0;
				dev[iter].ser = NULL;
				dev[iter].ver = 0;
			}
		}
	};


	class dxl20
	{
	private:
		HardwareSerial*	dxl_uart_;
		uint8_t			pin_txen_;
		crc				checker_;
		uint32_t		us_per_byte_;

		uint8_t			buffy_[DXL_BUFFER_SIZE];


	protected:
		
	public:
		dxl20();
		dxl20(HardwareSerial *ser, uint8_t txen);
		bool setup(HardwareSerial *ser, uint8_t txen);
		~dxl20();

		bool begin(uint32_t baud);
		bool end();

//		uint16_t crc(uint8_t *data, uint16_t len, uint16_t seed) {checker.crc(data,len,seed); }

		uint8_t		getReg1(uint8_t id, uint16_t reg_start);
		uint16_t	getReg2(uint8_t id, uint16_t reg_start);
		uint32_t	getReg4(uint8_t id, uint16_t reg_start);
		bool		putReg1(uint8_t id, uint16_t reg_start, uint8_t data);
		bool		putReg2(uint8_t id, uint16_t reg_start, uint16_t data);
		bool		syncWrite(uint8_t *params, uint16_t length);

		uint16_t	putReg(uint8_t id, uint8_t *params, uint16_t length, uint8_t *error);
		uint16_t	getReg(uint8_t id, uint16_t reg_start, uint16_t length, uint8_t *data);
		uint8_t		txrx(uint8_t *params, uint16_t &len, uint8_t id, uint8_t inst, uint8_t *return_data);

		dxl_def		other_dxl_;
		uint8_t		rxtx(uint32_t timeout_to_message);
	};


	class dxl10
	{
	private:
		HardwareSerial*	dxl_uart_;
		uint8_t			pin_txen_;
		uint32_t		us_per_byte_;

		uint8_t			buffy_[DXL_BUFFER_SIZE];

	protected:
		
	public:
		dxl10();
		dxl10(HardwareSerial *ser, uint8_t txen);
		bool setup(HardwareSerial *ser, uint8_t txen);
		~dxl10();

		bool begin(uint32_t baud);
		bool end();

		uint8_t checksum(uint8_t *data, uint8_t len);

		uint8_t		getReg1(uint8_t id, uint8_t reg_start);
		uint16_t	getReg2(uint8_t id, uint8_t reg_start);
		uint32_t	getReg4(uint8_t id, uint8_t reg_start);
		bool		putReg1(uint8_t id, uint8_t reg_start, uint8_t data);
		bool		putReg2(uint8_t id, uint8_t reg_start, uint16_t data);
		bool		syncWrite(uint8_t *params, uint8_t length);

		uint8_t		putReg(uint8_t id, uint8_t *params, uint8_t length, uint8_t *error);
		uint8_t		getReg(uint8_t id, uint8_t reg_start, uint8_t length, uint8_t *data);
		uint8_t		txrx(uint8_t *params, uint8_t &len, uint8_t id, uint8_t inst, uint8_t *return_data);
	};
}

#endif //_DXL_DUAL_H_

