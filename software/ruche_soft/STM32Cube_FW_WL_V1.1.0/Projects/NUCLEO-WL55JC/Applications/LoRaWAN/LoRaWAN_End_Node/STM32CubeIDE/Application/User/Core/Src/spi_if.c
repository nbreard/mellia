/*
 * spi_if.c
 *
 *  Created on: Mar 23, 2022
 *      Author: nicolas
 */
#include "stdint.h"
#include "spi_if.h"
#include "spi.h"
#include "stm32wlxx_hal_spi.h"
#include "string.h"


int8_t BME680_spi_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data,
		uint16_t len) {
	int8_t rslt = 0; /* Return 0 for Success, non-zero for failure */
	uint8_t dummy=0;
	HAL_GPIO_WritePin(BME_NSS_GPIO_Port, BME_NSS_Pin, RESET);
	rslt = HAL_SPI_TransmitReceive(&hspi2, &reg_addr,&dummy, 1, 1000);
	rslt = HAL_SPI_TransmitReceive(&hspi2, &dummy, reg_data, len, 1000);
	HAL_GPIO_WritePin(BME_NSS_GPIO_Port, BME_NSS_Pin, SET);

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

int8_t BME680_spi_write(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data,
		uint16_t len) {
	int8_t rslt = 0; /* Return 0 for Success, non-zero for failure */
	uint8_t dummy=0;
	HAL_GPIO_WritePin(BME_NSS_GPIO_Port, BME_NSS_Pin, RESET);
	//rslt = HAL_SPI_TransmitReceive(&hspi2, &reg_addr,reg_data, len, 1000);
	//	rslt = HAL_SPI_TransmitReceive(&hspi2, reg_data, &dummy, len, 1000);
	rslt=HAL_SPI_Transmit(&hspi2,&reg_addr, 1, 1000);
	rslt=HAL_SPI_Transmit(&hspi2,reg_data, len, 1000);
	HAL_GPIO_WritePin(BME_NSS_GPIO_Port, BME_NSS_Pin, SET);
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
	return (int8_t)rslt;
}
int8_t ADS_spi_read(int32_t *Raw_Data)
{
	int8_t rslt = 0; /* Return 0 for Success, non-zero for failure */
	uint8_t Reg_Data[3]={0};
	uint8_t Dummy=1;


	//HAL_Delay(100); //wait for power up
	rslt = HAL_SPI_Receive(&hspi2,Reg_Data, 3, 1000);

	*Raw_Data=Reg_Data[2] |Reg_Data[1]<<8| Reg_Data[0] <<16;
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
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13,SET);
	HAL_Delay(20);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13,RESET);
	return rslt;
}


