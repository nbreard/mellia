#include "gas_sensor.h"
#include "bme680_defs.h"
#include "bme680.h"
#include "i2c_if.h"
#include "i2c.h"
#include "sys_sensors.h"
#include "main.h"
#include "bme680_selftest.h"

HAL_StatusTypeDef   gas_Sensor_Init(struct bme680_dev *gas_sensor)
{


	gas_sensor->dev_id  = BME680_I2C_ADDR_PRIMARY;
	gas_sensor->intf     = BME680_I2C_INTF;
	gas_sensor->read     = user_i2c_read;
	gas_sensor->write    = user_i2c_write;
	gas_sensor->delay_ms = HAL_Delay;
	/* amb_temp can be set to 25 prior to configuring the gas sensor
	 * or by performing a few temperature readings without operating the gas sensor.
	 */
	gas_sensor->amb_temp = 25;
	MX_I2C1_Init();

	HAL_StatusTypeDef rslt = BME680_OK;
	rslt=bme680_init(gas_sensor);
	//rslt=bme680_Config_ForcedMode(gas_sensor);


	return rslt;
}

HAL_StatusTypeDef   gas_Sensor_Read_data(struct bme680_dev *gas_sensor,sensor_t *sensor_data)
{
	/*	uint8_t rslt=0;
	struct bme680_field_data *gas_sensor_data={0};
	  uint16_t meas_period;
	  bme680_get_profile_dur(&meas_period, gas_sensor);

	  rslt=bme680_Config_ForcedMode(gas_sensor);
	  gas_sensor->delay_ms(meas_period);

	rslt=bme680_get_sensor_data(gas_sensor_data, gas_sensor);*/
	uint8_t rslt=BME680_OK;

	gas_sensor->power_mode = BME680_FORCED_MODE;

	uint16_t settings_sel;

	/* Set the temperature, pressure and humidity & filter settings */
	gas_sensor->tph_sett.os_hum = BME680_OS_1X;
	gas_sensor->tph_sett.os_pres = BME680_OS_16X;
	gas_sensor->tph_sett.os_temp = BME680_OS_2X;

	/* Set the remaining gas sensor settings and link the heating profile */
	gas_sensor->gas_sett.run_gas = BME680_ENABLE_GAS_MEAS;
	gas_sensor->gas_sett.heatr_dur = HEATR_DUR;

	settings_sel = BME680_OST_SEL | BME680_OSP_SEL | BME680_OSH_SEL | BME680_GAS_SENSOR_SEL;
	uint16_t profile_dur = 0;
	struct bme680_field_data data[N_MEAS];
	bme680_get_profile_dur(&profile_dur, gas_sensor);

	uint8_t i = 0;
	while ((rslt == BME680_OK) && (i < N_MEAS)) {
		if (rslt == BME680_OK) {

			if (i % 2 == 0)
				gas_sensor->gas_sett.heatr_temp = HIGH_TEMP; /* Higher temperature */
			else
				gas_sensor->gas_sett.heatr_temp = LOW_TEMP; /* Lower temperature */

			rslt = bme680_set_sensor_settings(settings_sel, gas_sensor);

			if (rslt == BME680_OK) {

				rslt = bme680_set_sensor_mode(gas_sensor); /* Trigger a measurement */

				gas_sensor->delay_ms(profile_dur); /* Wait for the measurement to complete */

				rslt = bme680_get_sensor_data(&data[i], gas_sensor);
			}
		}
		i++;
	}




	sensor_data->humidity    = (float)data->humidity;
	sensor_data->temperature = (float) data->temperature;
	sensor_data->pressure    = (float)data->pressure;

	return rslt;

}
