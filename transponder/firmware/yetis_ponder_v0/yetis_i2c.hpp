/*
 *******************************************************************************
 * YETIS MechWarfare - I2C Interface
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
YETIS_I2C_UNIVERSALS
	ADDR: NAME
	0x00: Model Number								(R-)
			LIGHTS/TARGET BOARD:	0x01
			LIGHTS/SOUNDS BOARD:	0x02
			FIRE CONTROL BOARD:		0x05
	0x01: Hardware Revision							(R-)
	0x02: Firmware Revision							(R-)
	0x03: ID Number									(RW)
			LIGHTS/TARGET BOARD:	0x00~0x1F
			LIGHTS/SOUNDS BOARD:	0x20~0x2F
			FIRE CONTROL BOARD:		0x50~0x5F
			

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
YETIS_LTB_I2C properties
	ADDR: NAME
	0x10: Status
		Bit-0: (R-) IM_HIT (cleared when READ by master)
		Bit-1: (-W) OTHER_HIT
		Bit-2: (-W) HAVE_FLAG
		Bit-3: (-W) AM_CAPTURING

		Bit-4: (--) RESERVED for future use
		Bit-5: (--) RESERVED for future use
		Bit-6: (-W) SAVE current settings to EEPROM
		Bit-7: (-W) REBOOT (to EEPROM defaults using WDReset)

	0x11: Number Hits since last read					(R-) (0x00~0xFF)

Default values grabbed from EEPROM at boot
	0x20: Hit Duration [ms](L)							(RW) (0x0000~0xFFFF)
	0x21: Hit Duration [ms](H)							(RW) (0x0000~0xFFFF)
	0x22: Hit Standoff [ms](L)							(RW) (0x0000~0xFFFF)
	0x23: Hit Standoff [ms](H)							(RW) (0x0000~0xFFFF)

	0x30: FSR Sequential Detections Per Hit				(RW) (1~50)
	0x31: FSR Threshold									(RW) (50~250)
	0x32: FSR CALIBRATION MODE ENABLE					(RW) (0~1)

		LED: xSSS xRRR
			RRR		000	 0.25Hz
					001	 0.50Hz
					010	 1.00Hz
					011	 2.00Hz
					100	 5.00Hz
					101	10.00Hz
			SSS
					000	alternating
					001 synchronous
					010	'flowing' (NONE, CH1, CH1+CH2, CH2, NONE)
					100 CH1 only
					101 CH2 only
	0x40: LED Hit Value									(RW) (0x00~0x??)
	0x41: LED Flag Value								(RW) (0x00~0x??)
	0x42: LED Capture Value								(RW) (0x00~0x??)


///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
YETIS_LSB_I2C properties
	ADDR: NAME
	0x10: Status
		Bit-0: (--) RESERVED for future use
		Bit-1: (-W) OTHER_HIT
		Bit-2: (-W) HAVE_FLAG
		Bit-3: (-W) AM_CAPTURING

		Bit-4: (--) RESERVED for future use
		Bit-5: (--) RESERVED for future use
		Bit-6: (-W) SAVE current settings to EEPROM
		Bit-7: (-W) REBOOT (to EEPROM defaults using WDReset)

	0x11: 												(--) (0x??)

Default values grabbed from EEPROM at boot
	0x20: Hit Duration [ms](L)							(RW) (0x0000~0xFFFF)
	0x21: Hit Duration [ms](H)							(RW) (0x0000~0xFFFF)

		LED: xSSS xRRR
			RRR		000	 0.25Hz
					001	 0.50Hz
					010	 1.00Hz
					011	 2.00Hz
					100	 5.00Hz
					101	10.00Hz
			SSS
					000	alternating
					001 synchronous
					010	'flowing'
					100 CH1 only
					101 CH2 only
	0x40: LED Hit Value									(RW) (0x00~0x??)
	0x41: LED Flag Value								(RW) (0x00~0x??)
	0x42: LED Capture Value								(RW) (0x00~0x??)

		BUZZER: xSSS xRRR
			RRR		000	 0.25Hz
					001	 0.50Hz
					010	 1.00Hz
					011	 2.00Hz
					100	 5.00Hz
					101	10.00Hz
			SSS
					000	chirp high
					001 chirp low
					010	two-tone / ping-pong / warble
					011 WAH-wah-waaaah
					100 rising
					101 falling
	0x50: Buzzer Hit Value								(RW) (0x00~0x??)
	0x51: Buzzer Flag Value								(RW) (0x00~0x??)
	0x52: Buzzer Capture Value							(RW) (0x00~0x??)

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
YETIS_FCB_I2C properties
	ADDR: NAME
	0x10: Status
		Bit-0: (RW) WEAPONS_FREE
		Bit-1: (R-) OUT_OF_AMMO
		Bit-2: (-W) FIRE (1[s] burst if PWM only) (1 round if monitored)
		Bit-3: (RW) LASER_SIGHT_ENABLED

		Bit-4: (--) RESERVED for future use
		Bit-5: (--) RESERVED for future use
		Bit-6: (-W) SAVE current settings to EEPROM
		Bit-7: (-W) REBOOT (to EEPROM defaults using WDReset)

	0x11: Estimated ammo remaining(L)					(RW) (0x0000~0xFFFF)
	0x12: Estimated ammo remaining(H)					(RW) (0x0000~0xFFFF)

Default values grabbed from EEPROM at boot
	0x20: Maximum ammo capacity(L)						(RW) (0x0000~0xFFFF)
	0x21: Maximum ammo capacity(H)						(RW) (0x0000~0xFFFF)
	0x22: Fire control PWM value(L)						(RW) (0x0000~0xFFFF)
	0x23: Fire control PWM value(H)						(RW) (0x0000~0xFFFF)
	0x24: Fire standoff [ms](L)							(RW) (0x0000~0xFFFF)
	0x25: Fire standoff [ms](H)							(RW) (0x0000~0xFFFF)

*/


#ifndef _YETIS_MW_I2C_H_
#define _YETIS_MW_I2C_H_

#include <Wire.h>

#define YETIS_MIN_VHARD_LTB		0
#define YETIS_MIN_VHARD_LSB		0
#define YETIS_MIN_VHARD_FCB		0

#define YETIS_MIN_VFIRM_LTB		0
#define YETIS_MIN_VFIRM_LSB		0
#define YETIS_MIN_VFIRM_FCB		0

namespace mechwarfare
{
	class yetisI2C
	{
	private:
		pin pin_i2c_sda, pin_i2c_scl;

		enum
		{
			YETIS_MODEL_LTB			= 0x01,
			YETIS_MODEL_LSB			= 0x02,
			YETIS_MODEL_FCB			= 0x05
		};

		enum
		{
			YETIS_MIN_ID_LTB		= 0x00,
			YETIS_MAX_ID_LTB		= 0x1F,
			YETIS_MIN_ID_LSB		= 0x20,
			YETIS_MAX_ID_LSB		= 0x2F,
			YETIS_MIN_ID_FCB		= 0x50,
			YETIS_MAX_ID_FCB		= 0x5F
		};

		uint8_t idsLTB[YETIS_MAX_ID_LTB-YETIS_MIN_ID_LTB];
		uint8_t numLTB;
		uint8_t idsLSB[YETIS_MAX_ID_LSB-YETIS_MIN_ID_LSB];
		uint8_t numLSB;
		uint8_t idsFCB[YETIS_MAX_ID_FCB-YETIS_MIN_ID_FCB];
		uint8_t numFCB;

	protected:
		
	public:
		
	};







}//namespace mechwarfare

#endif //_YETIS_MW_I2C_H_