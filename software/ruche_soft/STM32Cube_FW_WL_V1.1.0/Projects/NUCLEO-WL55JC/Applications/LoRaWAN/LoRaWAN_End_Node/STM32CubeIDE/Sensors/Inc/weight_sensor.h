/*
 * weight_sensor.h
 *
 *  Created on: Mar 30, 2022
 *      Author: nicolas
 */

#ifndef SENSORS_INC_WEIGHT_SENSOR_H_
#define SENSORS_INC_WEIGHT_SENSOR_H_

#include "main.h"
#include "stm32wlxx_hal_spi.h"

#include "sys_sensors.h"
#include "spi.h"

void ADS1232Sensors_Init(sensor_t *sensor_data);
void ADS1232_Read(sensor_t *sensor_data);
void ADS1232_OffsetReset();


#endif /* SENSORS_INC_WEIGHT_SENSOR_H_ */
