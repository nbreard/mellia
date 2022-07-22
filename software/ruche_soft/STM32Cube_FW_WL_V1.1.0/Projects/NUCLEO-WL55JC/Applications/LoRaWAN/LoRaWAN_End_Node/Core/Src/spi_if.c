/*
 * spi_if.c
 *
 *  Created on: Mar 23, 2022
 *      Author: nicolas
 */

#include "spi_if.h"
#include "spi.h"

int8_t user_spi_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data,
		uint16_t len) {
	int8_t rslt = 0; /* Return 0 for Success, non-zero for failure */
	rslt = HAL_SPI_TransmitReceive(&hspi2, &reg_addr, reg_data, len, 1000);
	/*
	 * The parameter dev_id can be used as a variable to select which Chip Select pin has
	 * to be set low to activate the relevant device on the SPI bus
	 */

	/*
	 * Data on the bus should be like
	 * |----------------+---------------------+-------------|
	 * | MOSI           | MISO                | Chip Select |
	 * |----------------+---------------------|-------------|
	 * | (don't care)   | (don't care)        | HIGH        |
	 * | (reg_addr)     | (don't care)        | LOW         |
	 * | (don't care)   | (reg_data[0])       | LOW         |
	 * | (....)         | (....)              | LOW         |
	 * | (don't care)   | (reg_data[len - 1]) | LOW         |
	 * | (don't care)   | (don't care)        | HIGH        |
	 * |----------------+---------------------|-------------|
	 */

	return rslt;
}

int8_t user_spi_write(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data,
		uint16_t len) {
	int8_t rslt = 0; /* Return 0 for Success, non-zero for failure */
	rslt = HAL_SPI_TransmitReceive(&hspi2, &reg_addr, reg_data, len, 1000);

	/*
	 * The parameter dev_id can be used as a variable to select which Chip Select pin has
	 * to be set low to activate the relevant device on the SPI bus
	 */

	/*
	 * Data on the bus should be like
	 * |---------------------+--------------+-------------|
	 * | MOSI                | MISO         | Chip Select |
	 * |---------------------+--------------|-------------|
	 * | (don't care)        | (don't care) | HIGH        |
	 * | (reg_addr)          | (don't care) | LOW         |
	 * | (reg_data[0])       | (don't care) | LOW         |
	 * | (....)              | (....)       | LOW         |
	 * | (reg_data[len - 1]) | (don't care) | LOW         |
	 * | (don't care)        | (don't care) | HIGH        |
	 * |---------------------+--------------|-------------|
	 */

	return rslt;
}
