/*
 * internal_sensor.c
 *
 *  Created on: Jun 24, 2022
 *      Author: nicolas
 */



#include "internal_sensor.h"
#include "i2c.h"

void internal_Init()
{
	MX_I2C2_Init();
	SHT2x_Init(_sht2x_ui2c);
	SHT2x_SetResolution(RES_14_12);
}

void internal_Read(sensor_t *sensor_data)
{

	sensor_data->internal_temp = SHT2x_GetTemperature(1);
	sensor_data->internal_hum = SHT2x_GetRelativeHumidity(1);
	// HAL_I2C_MspDeInit(&hi2c2);


}
