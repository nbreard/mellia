/*
 * flash.h
 *
 *  Created on: Oct 11, 2021
 *      Author: nicolas
 */

#ifndef INC_FLASH_H_
#define INC_FLASH_H_

#include <stdint.h>
#include "stm32_hal_legacy.h"
#include  "stm32l4xx_hal.h"
#include "stm32l4xx_hal_flash.h"
#include "main.h"


#define BASEPAGE 125

HAL_StatusTypeDef memory_erasePage(uint8_t pageNumber);
HAL_StatusTypeDef memory_write(uint8_t* p_wr,uint32_t addressToWrite);
HAL_StatusTypeDef memory_read(uint8_t *p_rd,uint32_t addressToRead, size_t size);


#endif /* INC_FLASH_H_ */
