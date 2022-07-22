/*
 * uart_if.c
 *
 *  Created on: Sep 30, 2021
 *      Author: nicolas
 */

#include "uart_if.h"
#include <string.h>
#include "stdio.h"


HAL_StatusTypeDef at_Com(UART_HandleTypeDef *huart,uint8_t *p_ack,uint8_t *p_rcv, int timeout_ms,uint8_t size)
{

	HAL_StatusTypeDef rslt=0;
	uint8_t tmp[256]={0};
	uint8_t i=0;

	if(HAL_UART_Transmit(huart,p_ack,size,timeout_ms))
	{
		rslt= huart->ErrorCode;
	}
	else
	{
		do
		{
			rslt=HAL_UART_Receive(huart,& tmp[i], 1, timeout_ms);
			if(i>=256)
			{
				printf("uart reception buffer flooded and going to be flushed\r\n");
				break;
			}
			i++;
			if(rslt)
			{
				rslt=huart->ErrorCode;
				break;
			}
		}while(tmp[i]!='\n');
		if(!rslt)
			printf("%s",tmp);
	}
	memcpy(p_rcv,tmp,strlen((char*)tmp));
	memset(tmp,0,i);
	return rslt;
}

HAL_StatusTypeDef at_send(UART_HandleTypeDef *huart,uint8_t *p_ack, int timeout_ms,uint8_t size)
{
	uint8_t rslt=0;
	rslt=at_Com(huart,p_ack,0, timeout_ms, size);

	return rslt;

}

