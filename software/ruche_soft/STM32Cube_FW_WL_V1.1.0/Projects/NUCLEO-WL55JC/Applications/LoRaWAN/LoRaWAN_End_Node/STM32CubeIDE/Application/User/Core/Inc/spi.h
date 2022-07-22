/*
 * spi.h
 *
 *  Created on: Mar 23, 2022
 *      Author: nicolas
 */

#ifndef APPLICATION_USER_CORE_SPI_H_
#define APPLICATION_USER_CORE_SPI_H_

#include "main.h"
#include "stm32wlxx_hal_spi.h"


#define BME_NSS_Pin GPIO_PIN_7
#define BME_NSS_GPIO_Port GPIOB
#define ADS_NSS_Pin GPIO_PIN_6
#define ADS_NSS_GPIO_Port GPIOB

extern SPI_HandleTypeDef hspi2;

void MX_SPI2_Init(void);


#endif /* APPLICATION_USER_CORE_SPI_H_ */
