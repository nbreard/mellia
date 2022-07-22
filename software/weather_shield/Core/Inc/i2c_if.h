/*
 * i2c_if.h
 *
 *  Created on: Aug 24, 2021
 *      Author: nicolas
 */

#ifndef APPLICATION_I2C_IF_H_
#define APPLICATION_I2C_IF_H_

#include "stdint.h"


int8_t user_i2c_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len);
int8_t user_i2c_write(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len);


#endif /* APPLICATION_I2C_IF_H_ */
