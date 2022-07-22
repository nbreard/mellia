/*
 * ringbuffer.h
 *
 *  Created on: 13 oct. 2021
 *      Author: nicolas
 */

#ifndef INC_RINGBUFFER_H_
#define INC_RINGBUFFER_H_

#include "stm32l4xx_hal.h"
#include "flash.h"

#define BASEADRESSFLASH 0x0803E800
#define MAXQUEUE 32

typedef struct circular_buf_s
{
	uint32_t * buffer;
	uint8_t cursor;
	size_t size;
	uint32_t base_adress;
}circular_buf_t;

uint32_t adressList[MAXQUEUE];
circular_buf_t queue;

void buffer_init(circular_buf_t *buff,uint32_t* list,size_t size,uint32_t baseAdress);
HAL_StatusTypeDef buffer_put(circular_buf_t *buff,uint8_t *p_wr);
HAL_StatusTypeDef buffer_get(circular_buf_t *buff,uint8_t *p_rd,size_t size);
HAL_StatusTypeDef buffer_flush(circular_buf_t *buff);

void buffer_example();

void __movecursor(circular_buf_t *buff);


#endif /* INC_RINGBUFFER_H_ */
