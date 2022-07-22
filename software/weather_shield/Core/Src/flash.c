/*
 * flash.c
 *
 *  Created on: Oct 11, 2021
 *      Author: nicolas
 */
#include "flash.h"


FLASH_EraseInitTypeDef Flash_EraseConfig;

HAL_StatusTypeDef memory_erasePage(uint8_t pageNumber)
{
	HAL_StatusTypeDef rslt= HAL_OK;
	uint32_t pageFault=0;

	Flash_EraseConfig.TypeErase= FLASH_TYPEERASE_PAGES;
	Flash_EraseConfig.Banks =FLASH_BANK_1;
	Flash_EraseConfig.Page =pageNumber;
	Flash_EraseConfig.NbPages= 1 ; //1page =4kB
	rslt=HAL_FLASH_Unlock();

	rslt=HAL_FLASHEx_Erase(&Flash_EraseConfig, &pageFault);
	rslt=HAL_FLASH_Lock();

	return rslt;

}



HAL_StatusTypeDef memory_write(uint8_t *p_wr,uint32_t addressToWrite)
{
	HAL_StatusTypeDef rslt= HAL_OK;

	uint64_t  *dataToWrite=0;
			dataToWrite=	(uint64_t *) p_wr;

	uint8_t len=sizeof(dataToWrite)/sizeof(uint64_t);
	if(len<=1)
		len=1;

	rslt=HAL_FLASH_Unlock();
	if(rslt==HAL_OK)
	{

		for(uint32_t i=0; i<=len; i++)
		{
			rslt=HAL_FLASH_Program(FLASH_TYPEPROGRAM_DOUBLEWORD, addressToWrite, dataToWrite[i]);
			if(rslt!= HAL_OK)
			{
				return rslt;
			}
			addressToWrite+=8;
		}
		rslt=HAL_FLASH_Lock();
		return rslt;
	}
	else
		return rslt;

}

HAL_StatusTypeDef memory_read(uint8_t *p_rd,uint32_t addressToRead, size_t size)
{
	HAL_StatusTypeDef rslt=HAL_OK;
	rslt=HAL_FLASH_Unlock();
	if(rslt==HAL_OK)
	{
		for(uint32_t i=0; i<size; i++)
		{
			*((uint8_t *)p_rd + i) = *(uint8_t *)addressToRead;
			addressToRead++;
		}
		return rslt;
	}
	else
		return rslt;
}
