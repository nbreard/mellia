/*
 * weight_sensor.c
 *
 *  Created on: Mar 30, 2022
 *      Author: nicolas
 */

#include "weight_sensor.h"

void ADS1232Sensors_Init(sensor_t *sensor_data)
{
	sensor_data->scale.wfs=90;
	sensor_data->scale.wt=0;

	/*pour 100kg*/
/*
	sensor_data->scale.m=2.2357e-05;
	sensor_data->scale.wzs=0.064701;
*/


	/*pour 250kg*/
	sensor_data->scale.m=5.8136e-05;
	sensor_data->scale.wzs=0.2559;

	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();

	GPIO_InitTypeDef GPIO_InitStruct = {0};

	GPIO_InitStruct.Pin = GPIO_PIN_3;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);


	GPIO_InitStruct.Pin = GPIO_PIN_13;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);


	GPIO_InitStruct.Pin = GPIO_PIN_14;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);




}

/*HAL_StatusTypeDef ADS1232_Read(sensor_t *sensor_data)
{
	uint8_t rslt=0;
	int32_t spl=0;
	 sensor_data->scale.c=0;
	MX_SPI2_Init();


	//acquisition data
	HAL_GPIO_WritePin(ADS_NSS_GPIO_Port, ADS_NSS_Pin,SET);
	HAL_Delay(10);
	HAL_GPIO_WritePin(ADS_NSS_GPIO_Port, ADS_NSS_Pin,RESET);
	HAL_Delay(10);
	HAL_GPIO_WritePin(ADS_NSS_GPIO_Port, ADS_NSS_Pin,SET);
	HAL_Delay(10);

	//shoot the offset
	ADS1232_OffsetReset();
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13,SET);
	HAL_Delay(20);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13,RESET);

	for(int i=0;i<16;i++)
	{
	 while(HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_14)!=  GPIO_PIN_RESET);
	 ADS_spi_read(&spl);
	 sensor_data->scale.c+=spl;
	}
	HAL_GPIO_WritePin(ADS_NSS_GPIO_Port, ADS_NSS_Pin,RESET);

	//filtrage
	sensor_data->scale.c/=16;
	if(sensor_data->scale.c&0x00800000)
	{
		sensor_data->scale.c|=0xFF000000;
	}
	//convertion


	return rslt;
}*/


void ADS1232_Read(sensor_t *sensor_data)
{
	/*wake up the adc */
	HAL_GPIO_WritePin(ADS_NSS_GPIO_Port, ADS_NSS_Pin,SET);
	HAL_GPIO_WritePin(ADS_NSS_GPIO_Port, ADS_NSS_Pin,RESET);
	HAL_GPIO_WritePin(ADS_NSS_GPIO_Port, ADS_NSS_Pin,SET);


	// wait for DOUT to go low : data ready
	while (HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_14))
		;

	for (uint8_t i = 0; i < 24; i++)
	{
		sensor_data->scale.c = sensor_data->scale.c << 1;

		// send clock pulse
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, 1);
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, 0);

		// read the data in
		if (HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_14))
		{
			sensor_data->scale.c |= 1;
		}
	}

	// reset DOUT
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, 1);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, 0);

	/*shutdown the adc */
	HAL_GPIO_WritePin(ADS_NSS_GPIO_Port, ADS_NSS_Pin,RESET);


	// 24-32 bit 2s complement conversion
	sensor_data->scale.c <<= 8;
	sensor_data->scale.c /= 256;

}





void ADS1232_OffsetReset()
{
	for(int i=0;i<26;i++)
	{
		HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_13);
		HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_13);
	}
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, SET);
	HAL_Delay(1000);
}
