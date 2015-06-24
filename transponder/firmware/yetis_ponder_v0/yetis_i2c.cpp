

namespace mechwarfare
{

yetisI2C::yetisI2C(pin sda, pin scl)
{
	pin_i2c_sda = sda;
	pin_i2c_scl	= scl;
	Wire.begin(pin_i2c_sda, pin_i2c_scl); // Wire.begin(sda, scl)

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


void yetisI2C::configure(uint8_t ***configs, uint8_t num)
{
/*
	configs
		[devConDat0]...[devConDatN]
		devConDat
			[nConf][model][conDat*]...[conDat*]
			conDat
				[addr][len][data0]...[dataN]
*/
	uint8_t iter, jter, kter;

	for (iter=0; iter<num; iter++)
	{
		// [addr][len][data0]...[dataN]
		uint8_t **devConDat = configs[iter];
		uint8_t nConf = (uint8_t) devConDat[0];
		uint8_t model = (uint8_t) devConDat[1];

		if (model == YETIS_MODEL_LTB)
		{
			// Configure I2C Lights/Target Boards
			for (jter=0; jter<numLTB; jter++)
			{
				for (kter=0; kter<nConf; kter++)
				{
					uint8_t *conDat = devConDat[2+kter];
					uint8_t addr = conDat[0];
					uint8_t len = conDat[1];

					Wire.beginTransmission(idsLTB[jter]);
					// Set ADDR of register at which to start next WRITE
					Wire.write( addr );
					Wire.write( (conDat+2), len );

					Wire.endTrasmission();
				}

				Wire.beginTransmission(idsLTB[jter]);
				// Set ADDR of register at which to start next WRITE
				Wire.write( 0x10 );
				Wire.write( WRITE_TO_EEPROM );
				Wire.endTrasmission();
			}
		}
		else if (model == YETIS_MODEL_LSB)
		{
			// Configure I2C Lights/Sounds Boards
			for (jter=0; jter<numLSB; jter++)
			{
				for (kter=0; kter<nConf; kter++)
				{
					uint8_t *conDat = devConDat[2+kter];
					uint8_t addr = conDat[0];
					uint8_t len = conDat[1];

					Wire.beginTransmission(idsLSB[jter]);
					// Set ADDR of register at which to start next WRITE
					Wire.write( addr );
					Wire.write( (conDat+2), len );

					Wire.endTrasmission();
				}

				Wire.beginTransmission(idsLSB[jter]);
				// Set ADDR of register at which to start next WRITE
				Wire.write( 0x10 );
				Wire.write( WRITE_TO_EEPROM );
				Wire.endTrasmission();
			}
		}
		else if (model == YETIS_MODEL_FCB)
		{
			// Configure I2C Fire Control Boards
			for (jter=0; jter<numFCB; jter++)
			{
				for (kter=0; kter<nConf; kter++)
				{
					uint8_t *conDat = devConDat[2+kter];
					uint8_t addr = conDat[0];
					uint8_t len = conDat[1];

					Wire.beginTransmission(idsFCB[jter]);
					// Set ADDR of register at which to start next WRITE
					Wire.write( addr );
					Wire.write( (conDat+2), len );

					Wire.endTrasmission();
				}

				Wire.beginTransmission(idsFCB[jter]);
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
	return 0;
}

uint16_t yetisI2C::process(uint8_t bussStatus)
{
	bussStatus &= ( HAVE_FLAG | AM_CAPTURING );

	uint16_t numHits = 0;

	// Poll I2C Lights/Target Boards
	for (iter=0; iter<numLTB; iter++)
	{
		Wire.beginTransmission(idsLTB[iter]);
		// Set ADDR of register at which to start next READ
		Wire.write(0x10);
		Wire.requestFrom(idsLTB[iter], 2);

		if ( Wire.available() != 2 )
		{
			while (Wire.available()>0)
			{
				uint8_t crap = Wire.read();
			}
			Wire.endTrasmission();
			continue;
		}

		uint8_t status = Wire.read();
		uint8_t numHit = Wire.read();
		if (status & IM_HIT)
		{
			bussStatus |= OTHER_HIT;
			numHits += numHit;
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

	return numHits;
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
	Wire.write(FIRE);

	Wire.endTrasmission();

	return remaining;
}



}//namespace mechwarfare
