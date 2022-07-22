/*
 * spi_if.h
 *
 *  Created on: Mar 23, 2022
 *      Author: nicolas
 */

#ifndef APPLICATION_USER_CORE_SPI_IF_H_
#define APPLICATION_USER_CORE_SPI_IF_H_

#include "stdint.h"

int8_t BME680_spi_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len);
int8_t BME680_spi_write(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len);

int8_t ADS_spi_read(int32_t *Raw_Data);
void ADS1232_OffsetReset();

#endif /* APPLICATION_USER_CORE_SPI_IF_H_ */
