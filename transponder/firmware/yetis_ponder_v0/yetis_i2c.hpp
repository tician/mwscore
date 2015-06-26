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

	0x11: Damage since last reboot(L)					(R-) (0x0000~0xFFFF)
	0x12: Damage since last reboot(H)					(R-) (0x0000~0xFFFF)

Default values grabbed from EEPROM at boot
	0x20: Hit Duration [ms](L)							(RW) (0x0000~0xFFFF)
	0x21: Hit Duration [ms](H)							(RW) (0x0000~0xFFFF)
	0x22: Hit Standoff [ms](L)							(RW) (0x0000~0xFFFF)
	0x23: Hit Standoff [ms](H)							(RW) (0x0000~0xFFFF)
	0x24: Damage-Per-Hit Value							(RW) (0x00~0xFF)

	0x30: FSR Sequential Detections Per Hit				(RW) (1~50)
	0x31: FSR Threshold									(RW) (50~250)
	0x32: FSR CALIBRATION MODE ENABLE					(RW) (0~1)

		LED: xSSS FRRR
			F
					1	FORCE_ACTIVE
			RRR
					000	FREQ_8_000Hz
					001	FREQ_4_000Hz
					010	FREQ_2_000Hz
					011	FREQ_1_000Hz
					100	FREQ_0_500Hz
					101	FREQ_0_250Hz
					110	FREQ_0_125Hz
					111	FREQ_0_000Hz
			SSS
					000 NONE
					001	ALTERNATING
					010	SYNCHRONOUS
					011	FLOWING (NONE, CH1, CH1+CH2, CH2, NONE)
					100	CH1_ONLY
					101	CH2_ONLY
					110	CH1_SOLID + CH2_FLASHING
					111	CH1_FLASHING + CH2_SOLID
	0x40: LED State										(RW) (0x00~0xFF)
	0x41: LED IM_HIT Value								(RW) (0x00~0xFF)
	0x42: LED OTHER_HIT Value							(RW) (0x00~0xFF)
	0x43: LED HAVE_FLAG Value							(RW) (0x00~0xFF)
	0x44: LED AM_CAPTURING Value						(RW) (0x00~0xFF)


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

		LED: xSSS FRRR
			F
					1	FORCE_ACTIVE
			RRR
					000	FREQ_8_000Hz
					001	FREQ_4_000Hz
					010	FREQ_2_000Hz
					011	FREQ_1_000Hz
					100	FREQ_0_500Hz
					101	FREQ_0_250Hz
					110	FREQ_0_125Hz
					111	FREQ_0_000Hz
			SSS
					000 NONE
					001	ALTERNATING
					010	SYNCHRONOUS
					011	FLOWING (NONE, CH1, CH1+CH2, CH2, NONE)
					100	CH1_ONLY
					101	CH2_ONLY
					110	CH1_SOLID + CH2_FLASHING
					111	CH1_FLASHING + CH2_SOLID
	0x40: LED State										(RW) (0x00~0xFF)
	0x41: LED IM_HIT Value								(RW) (0x00~0xFF)
	0x42: LED OTHER_HIT Value							(RW) (0x00~0xFF)
	0x43: LED HAVE_FLAG Value							(RW) (0x00~0xFF)
	0x44: LED AM_CAPTURING Value						(RW) (0x00~0xFF)

		BUZZER: xSSS FRRR
			F
					1	FORCE_ACTIVE
			RRR
					000	FREQ_8_000Hz
					001	FREQ_4_000Hz
					010	FREQ_2_000Hz
					011	FREQ_1_000Hz
					100	FREQ_0_500Hz
					101	FREQ_0_250Hz
					110	FREQ_0_125Hz
					111	FREQ_0_000Hz
			SSS
					000 NONE
					001	BEEP_LOW
					010	BEEP_MID
					011	BEEP_HIGH
					100	WARBLE
					101	WAHWAHWAH
					110	RISING
					111	FALLING
	0x50: Buzzer State									(RW) (0x00~0xFF)
	0x51: Buzzer IM_HIT Value							(RW) (0x00~0xFF)
	0x52: Buzzer OTHER_HIT Value						(RW) (0x00~0xFF)
	0x53: Buzzer HAVE_FLAG Value						(RW) (0x00~0xFF)
	0x54: Buzzer AM_CAPTURING Value						(RW) (0x00~0xFF)

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
YETIS_FCB_I2C properties
	ADDR: NAME
	0x10: Status
		Bit-0: (RW) WEAPONS_FREE
		Bit-1: (R-) OUT_OF_AMMO
		Bit-2: (-W) FIRE_ONCE (1[s] burst if PWM only) (1 round if monitored)
		Bit-3: (RW) LASER_SIGHT_ENABLED

		Bit-4: (--) RESERVED for future use
		Bit-5: (--) RESERVED for future use
		Bit-6: (-W) SAVE current settings to EEPROM
		Bit-7: (-W) REBOOT (to EEPROM defaults using WDReset)

	0x11: Estimated rounds/seconds ammo remaining(L)	(RW) (0x0000~0xFFFF)
	0x12: Estimated rounds/seconds ammo remaining(H)	(RW) (0x0000~0xFFFF)

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
	public:
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
		enum
		{
			SAVE_TO_EEPROM			= (1<<6),
			REBOOT					= (1<<7)
		};
		enum
		{
			IM_HIT					= (1<<0),
			OTHER_HIT				= (1<<1),
			HAVE_FLAG				= (1<<2),
			AM_CAPTURING			= (1<<3)
		};
		enum
		{
			WEAPONS_FREE			= (1<<0),
			OUT_OF_AMMO				= (1<<1),
			FIRE_ONCE				= (1<<2),
			LASER_SIGHT_ENABLED		= (1<<3)
		};
		enum
		{
			FREQ_00_000Hz			= 0x00,
			FREQ_00_125Hz			= 0x01,
			FREQ_00_250Hz			= 0x02,
			FREQ_00_500Hz			= 0x03,
			FREQ_01_000Hz			= 0x04,
			FREQ_02_000Hz			= 0x05,
			FREQ_05_000Hz			= 0x06,
			FREQ_10_000Hz			= 0x07,
			FORCE_ACTIVE			= 0x08
		};
		enum
		{
			LEDS_ALTERNATING		= 0x00,
			LEDS_SYNCHRONOUS		= 0x10,
			LEDS_FLOWING			= 0x20,
			LEDS_CH1				= 0x30,
			LEDS_CH2				= 0x40,
			LEDS_CH1S_CH2F			= 0x50,
			LEDS_CH1F_CH2S			= 0x60
		};
		enum
		{
			BUZZ_BEEP_LOW			= 0x00,
			BUZZ_BEEP_MID			= 0x10,
			BUZZ_BEEP_HIGH			= 0x20,
			BUZZ_WARBLE				= 0x30,
			BUZZ_WAHWAHWAH			= 0x40,
			BUZZ_RISING				= 0x50,
			BUZZ_FALLING			= 0x60
		};

	private:
		uint8_t idsLTB[YETIS_MAX_ID_LTB-YETIS_MIN_ID_LTB];
		uint8_t numLTB;
		uint8_t idsLSB[YETIS_MAX_ID_LSB-YETIS_MIN_ID_LSB];
		uint8_t numLSB;
		uint8_t idsFCB[YETIS_MAX_ID_FCB-YETIS_MIN_ID_FCB];
		uint8_t numFCB;

	protected:
		
	public:
		yetisI2C(int sda, int scl);
		void search(void);
		void configure(uint8_t model, uint8_t **configs, uint8_t nConfigs);
		uint16_t process(uint8_t bussStatus);
		bool weaponsFree(bool guns, bool laser);
		uint16_t fire(uint8_t weapon_number);


	};







}//namespace mechwarfare

#endif //_YETIS_MW_I2C_H_
