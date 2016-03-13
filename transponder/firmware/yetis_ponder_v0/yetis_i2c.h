/*
 *******************************************************************************
 * YETIS MechWarfare - I2C Interface
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

#ifndef _YETIS_I2C_SPONDER_H_
#define _YETIS_I2C_SPONDER_H_

#include <Wire.h>
#include "yetis_i2c_devs.h"

namespace mechwarfare
{
	class yetisI2C
	{
	private:
		uint8_t idsLTB[yetisI2Cdevs::YETIS_MAX_ID_LTB-yetisI2Cdevs::YETIS_MIN_ID_LTB];
		uint8_t numLTB;
		uint8_t idsLSB[yetisI2Cdevs::YETIS_MAX_ID_LSB-yetisI2Cdevs::YETIS_MIN_ID_LSB];
		uint8_t numLSB;
		uint8_t idsFCB[yetisI2Cdevs::YETIS_MAX_ID_FCB-yetisI2Cdevs::YETIS_MIN_ID_FCB];
		uint8_t numFCB;

	protected:

	public:
		yetisI2C() {yetisI2C(0,2);}
		yetisI2C(int sda, int scl);
		void search(void);
		void configure(uint8_t model, uint8_t **configs, uint8_t nConfigs);
		uint16_t process(uint8_t bussStatus);
		bool weaponsFree(bool guns, bool laser);
		uint16_t fire(uint8_t weapon_number);


	};







}//namespace mechwarfare

#endif //_YETIS_I2C_SPONDER_H_
