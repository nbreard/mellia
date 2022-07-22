/*
 * i2c.h
 *
 *  Created on: Mar 23, 2022
 *      Author: nicolas
 */

#ifndef APPLICATION_USER_CORE_i2c_H_
#define APPLICATION_USER_CORE_i2c_H_

#include "main.h"
#include "stm32wlxx_hal_i2c.h"

#define I2C_SDA_Pin GPIO_PIN_15
#define I2C_SDA_GPIO_Port GPIOA
#define I2C_SCL_Pin GPIO_PIN_15
#define I2C_SCL_GPIO_Port GPIOB


extern I2C_HandleTypeDef hi2c2;

void MX_SPI2_Init(void);


#endif /* APPLICATION_USER_CORE_i2c_H_ */
