/*
 * internal_sensor.h
 *
 *  Created on: Jun 24, 2022
 *      Author: nicolas
 */

#ifndef SENSORS_INC_INTERNAL_SENSOR_H_
#define SENSORS_INC_INTERNAL_SENSOR_H_

#include "main.h"
#include "stm32wlxx_hal_i2c.h"

#include "../../SHT2x_for_STM32_HAL/sht2x_for_stm32_hal.h"

#include "sys_sensors.h"
#include "i2c.h"



void internal_Init();

void internal_Read(sensor_t *sensor_data);


#endif /* SENSORS_INC_INTERNAL_SENSOR_H_ */
