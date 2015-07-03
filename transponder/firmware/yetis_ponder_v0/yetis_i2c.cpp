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

namespace mechwarfare
{

yetisI2C::yetisI2C(int sda, int scl)
{
#ifdef ESP8266
	Wire.begin(sda, scl); // Wire.begin(sda, scl)
#else
	Wire.begin(); // Wire.begin()
#endif
	numLTB = 0;
	numLSB = 0;
	numFCB = 0;
}

void yetisI2C::search(void)
{
	uint8_t iter;

	// Find I2C Lights/Target Boards
	for (iter=YETIS_MIN_ID_LTB; iter<=YETIS_MAX_ID_LTB; iter++)
	{
		Wire.beginTransmission(iter);
		// Set ADDR of register at which to start next READ
 		Wire.write(0x00);
		// Check for existence and operating parameters
		Wire.requestFrom(iter, 4);

		if ( Wire.available() != 4 )
		{
			while (Wire.available()>0)
			{
				uint8_t crap = Wire.read();
			}
			Wire.endTrasmission();
			continue;
		}

		uint8_t model = Wire.read();
		uint8_t vhard = Wire.read();
		uint8_t vfirm = Wire.read();
		uint8_t myID  = Wire.read();

		Wire.endTrasmission();

		if (	(iter == myID) &&
				(model == YETIS_MODEL_LTB) &&
				(vhard >= YETIS_MIN_VHARD_LTB) &&
				(vfirm >= YETIS_MIN_VFIRM_LTB) )
		{
			idsLTB[numLTB] = iter;
			numLTB++;
		}
	}

	// Find I2C Lights/Sounds Boards
	for (iter=YETIS_MIN_ID_LSB; iter<=YETIS_MAX_ID_LSB; iter++)
	{
		Wire.beginTransmission(iter);
		// Set ADDR of register at which to start next READ
 		Wire.write(0x00);
		// Check for existence and operating parameters
		Wire.requestFrom(iter, 4);

		if ( Wire.available() != 4 )
		{
			while (Wire.available()>0)
			{
				uint8_t crap = Wire.read();
			}
			Wire.endTrasmission();
			continue;
		}

		uint8_t model = Wire.read();
		uint8_t vhard = Wire.read();
		uint8_t vfirm = Wire.read();
		uint8_t myID  = Wire.read();

		Wire.endTrasmission();

		if (	(iter == myID) &&
				(model == YETIS_MODEL_LSB) &&
				(vhard >= YETIS_MIN_VHARD_LSB) &&
				(vfirm >= YETIS_MIN_VFIRM_LSB) )
		{
			idsLSB[numLSB] = iter;
			numLSB++;
		}
	}

	// Find I2C Fire Control Boards
	for (iter=YETIS_MIN_ID_FCB; iter<=YETIS_MAX_ID_FCB; iter++)
	{
		Wire.beginTransmission(iter);
		// Set ADDR of register at which to start next READ
 		Wire.write(0x00);
		// Check for existence and operating parameters
		Wire.requestFrom(iter, 4);

		if ( Wire.available() != 4 )
		{
			while (Wire.available()>0)
			{
				uint8_t crap = Wire.read();
			}
			Wire.endTrasmission();
			continue;
		}

		uint8_t model = Wire.read();
		uint8_t vhard = Wire.read();
		uint8_t vfirm = Wire.read();
		uint8_t myID  = Wire.read();

		Wire.endTrasmission();

		if (	(iter == myID) &&
				(model == YETIS_MODEL_FCB) &&
				(vhard >= YETIS_MIN_VHARD_FCB) &&
				(vfirm >= YETIS_MIN_VFIRM_FCB) )
		{
			idsFCB[numFCB] = iter;
			numFCB++;
		}
	}
}


void yetisI2C::configure(uint8_t model, uint8_t **configs, uint8_t nConfigs)
{
/*
	configs
		[(uint8_t*)conDat0]...[(uint8_t*)conDatN]
		conDat
			[(uint8_t)addr][(uint8_t)len][(uint8_t)data0]...[(uint8_t)dataN]
*/
	uint8_t iter, jter;

	if (model == YETIS_MODEL_LTB)
	{
		// Configure I2C Lights/Target Boards
		for (iter=0; iter<numLTB; iter++)
		{
			for (jter=0; jter<nConfigs; jter++)
			{
				uint8_t *conDat = configs[iter];
				// [addr][len][data0]...[dataN]
				uint8_t addr = conDat[0];
				uint8_t len = conDat[1];

				Wire.beginTransmission(idsLTB[iter]);
				// Set ADDR of register at which to start next WRITE
				Wire.write( addr );
				Wire.write( (conDat+2), len );

				Wire.endTrasmission();
			}

			Wire.beginTransmission(idsLTB[iter]);
			// Set ADDR of register at which to start next WRITE
			Wire.write( 0x10 );
			Wire.write( WRITE_TO_EEPROM );
			Wire.endTrasmission();
		}
	}
	else if (model == YETIS_MODEL_LSB)
	{
		// Configure I2C Lights/Sounds Boards
		for (iter=0; iter<numLSB; iter++)
		{
			for (jter=0; jter<nConfigs; jter++)
			{
				uint8_t *conDat = configs[iter];
				// [addr][len][data0]...[dataN]
				uint8_t addr = conDat[0];
				uint8_t len = conDat[1];

				Wire.beginTransmission(idsLSB[iter]);
				// Set ADDR of register at which to start next WRITE
				Wire.write( addr );
				Wire.write( (conDat+2), len );

				Wire.endTrasmission();
			}

			Wire.beginTransmission(idsLSB[iter]);
			// Set ADDR of register at which to start next WRITE
			Wire.write( 0x10 );
			Wire.write( WRITE_TO_EEPROM );
			Wire.endTrasmission();
		}
	}
	else if (model == YETIS_MODEL_FCB)
	{
		// Configure I2C Fire Control Boards
		for (iter=0; iter<numFCB; iter++)
		{
			for (jter=0; jter<nConfigs; jter++)
			{
				uint8_t *conDat = configs[iter];
				// [addr][len][data0]...[dataN]
				uint8_t addr = conDat[0];
				uint8_t len = conDat[1];

				Wire.beginTransmission(idsFCB[iter]);
				// Set ADDR of register at which to start next WRITE
				Wire.write( addr );
				Wire.write( (conDat+2), len );

				Wire.endTrasmission();
			}

			Wire.beginTransmission(idsFCB[iter]);
			// Set ADDR of register at which to start next WRITE
			Wire.write( 0x10 );
			Wire.write( WRITE_TO_EEPROM );
			Wire.endTrasmission();
		}
	}
	else
	{
		// unsupported model
	}
}

uint16_t yetisI2C::process(uint8_t bussStatus)
{
	bussStatus &= ( HAVE_FLAG | AM_CAPTURING );

	uint16_t damage = 0;

	// Poll I2C Lights/Target Boards
	for (iter=0; iter<numLTB; iter++)
	{
		Wire.beginTransmission(idsLTB[iter]);
		// Set ADDR of register at which to start next READ
		Wire.write(0x10);
		Wire.requestFrom(idsLTB[iter], 3);

		if ( Wire.available() != 3 )
		{
			while (Wire.available()>0)
			{
				uint8_t crap = Wire.read();
			}
			Wire.endTrasmission();
			continue;
		}

		uint8_t status = Wire.read();
		uint8_t damageL = Wire.read();
		uint8_t damageH = Wire.read();
		damage += (damageL<<0) + (damageH<<8);

		if (status & IM_HIT)
		{
			bussStatus |= OTHER_HIT;
		}

		Wire.endTrasmission();
	}

	// Distribute bussStatus to I2C Lights/Target Boards and Lights/Sounds Boards
	for (iter=0; iter<numLTB; iter++)
	{
		Wire.beginTransmission(idsLTB[iter]);
		// Set ADDR of register at which to start next WRITE
		Wire.write(0x10);
		Wire.write(bussStatus);

		Wire.endTrasmission();
	}
	for (iter=0; iter<numLSB; iter++)
	{
		Wire.beginTransmission(idsLSB[iter]);
		// Set ADDR of register at which to start next WRITE
		Wire.write(0x10);
		Wire.write(bussStatus);

		Wire.endTrasmission();
	}

	return damage;
}

bool yetisI2C::weaponsFree(bool guns, bool laser)
{
	uint8_t status = 0;
	if (guns)
	{
		if (laser)
		{
			status |= (WEAPONS_FREE | LASER_SIGHT_ENABLED);
		}
		else
		{
			status |= WEAPONS_FREE;
		}
	}

	for (iter=0; iter<numFCB; iter++)
	{
		Wire.beginTransmission(idsFCB[iter]);
		// Set ADDR of register at which to start next WRITE
		Wire.write(0x10);
		Wire.write(status);

		Wire.endTrasmission();
	}
	if (status & WEAPONS_FREE)
		return true;
	else
		return false;
}

uint16_t yetisI2C::fire(uint8_t weapon_number)
{
	if (weapon_number >= numFCB)
	{
		return 0;
	}

	uint16_t remaining = 0;

	Wire.beginTransmission(idsFCB[weapon_number]);
	// Set ADDR of register at which to start next WRITE
	Wire.write(0x10);
	Wire.requestFrom(idsFCB[weapon_number], 3);

	if ( Wire.available() != 3)
	{
		while (Wire.available()>0)
		{
			uint8_t crap = Wire.read();
		}
		Wire.endTrasmission();
		return 0;
	}
	uint8_t status = Wire.read();
	uint8_t temp = Wire.read();
	remaining += (temp<<0);
	temp = Wire.read();
	remaining += (temp<<8);

	if ( !(status & WEAPONS_FREE) )
	{
		Wire.endTransmission();
		return 0;
	}
	if (status & OUT_OF_AMMO)
	{
		Wire.endTransmission();
		return 0;
	}
	
	Wire.write(0x10);
	Wire.write(FIRE_ONCE);

	Wire.endTrasmission();

	return remaining;
}



}//namespace mechwarfare
