/*
 * gas_sensor.h
 *
 *  Created on: Aug 24, 2021
 *      Author: nicolas
 */

#ifndef APPLICATION_USER_SENSORS_INC_GAS_SENSOR_H_
#define APPLICATION_USER_SENSORS_INC_GAS_SENSOR_H_

#include "spi.h"
#include "bme680.h"
#include "sys_sensors.h"

struct bme680_dev bme_gas_sensor;


HAL_StatusTypeDef   gas_Sensor_Init(struct bme680_dev *gas_sensor);
HAL_StatusTypeDef   gas_Sensor_Read_data(struct bme680_dev *gas_sensor,sensor_t *sensor_data);

void   gas_Sensor_DeInit();


#endif /* APPLICATION_USER_SENSORS_INC_GAS_SENSOR_H_ */
