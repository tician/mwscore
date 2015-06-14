/*
 *******************************************************************************
 * MechWarfare UDP Interface for ESP8266 NaNsponder
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
MW_ITB_I2C properties
	ADDR: NAME
	0x00: Status register
		Bit-0: (R-) IM_HIT (cleared when READ by master)
		Bit-1: (-W) OTHER_HIT
		Bit-2: (-W) HAVE_FLAG
		Bit-3: (RW) RESERVED for future use

		Bit-4: (-W) Save current ID to EEPROM
		Bit-5: (-W) Save current FSR_SDPH to EEPROM
		Bit-6: (-W) Save current FSR_THR to EEPROM
		Bit-7: (-W) RESET (to EEPROM defaults using WDReset)

Default values grabbed from EEPROM at boot
	0x01: ID register									(RW) (0x00~0x1F)
	0x02: FSR Sequential Detections Per Hit register	(RW) (1~50)
	0x03: FSR Threshold register						(RW) (50~250)

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
MW_TOPLED_I2C properties
	ADDR: NAME
	0x00: Status register
		Bit-0: (RW) RESERVED for future use
		Bit-1: (-W) PANEL_HIT
		Bit-2: (-W) HAVE_FLAG
		Bit-3: (RW) RESERVED for future use

		Bit-4: (-W) Save current ID to EEPROM
		Bit-5: (-W) RESERVED for future use
		Bit-6: (-W) RESERVED for future use
		Bit-7: (-W) RESET (to EEPROM defaults using WDReset)

Default values grabbed from EEPROM at boot
	0x01: ID register									(RW) (0x20~0x2F)

///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
MW_FCB_I2C properties
	ADDR: NAME
	0x00: Status register
		Bit-0: (RW) WEAPONS_FREE
		Bit-1: (R-) OUT_OF_AMMO
		Bit-2: (-W) FIRE (1[s] burst if PWM only) (1 round if monitored)
		Bit-3: (RW) RESERVED for future use

		Bit-4: (-W) Save current ID to EEPROM
		Bit-5: (-W) Save current MAX_AMMO_CAP to EEPROM
		Bit-6: (-W) Save current FIRE_PWM to EEPROM
		Bit-7: (-W) RESET (to EEPROM defaults using WDReset)

Default values grabbed from EEPROM at boot
	0x01: ID register									(RW) (0x50~0x5F)
	0x02: Estimated ammo remaining(L)					(RW) (0x0000~0xFFFF)
	0x03: Estimated ammo remaining(H)					(RW) (0x0000~0xFFFF)
	0x04: Maximum ammo capacity(L)						(RW) (0x0000~0xFFFF)
	0x05: Maximum ammo capacity(H)						(RW) (0x0000~0xFFFF)
	0x06: Fire control PWM value(L)						(RW) (0x0000~0xFFFF)
	0x07: Fire control PWM value(H)						(RW) (0x0000~0xFFFF)
*/


#ifndef _NAN_MW_I2C_H_
#define _NAN_MW_I2C_H_

#include <Wire.h>

namespace mechwarfare
{
	class mwI2C
	{
	private:
		
	protected:
		
	public:
		
	};







}//namespace mechwarfare

#endif //_NAN_MW_I2C_H_
