/* global RegisterGPO, Register, RegisterDS18B20 */

load('api_config.js');
load("api_gpio.js");
load("api_timer.js");
load("api_i2c.js");

load("api_df_reg.js");
load("api_df_reg_gpo.js");
load("api_df_reg_pcf8574.js");

let i2c = I2C.get();

let ledPin = Cfg.get("ssr8.led");
print("LED pin", ledPin);
Register.add("led", RegisterGPO.create(ledPin));

let pcfAddress = Cfg.get("ssr8.pcf8574");
print("PCF8574 address", pcfAddress);
let pcf = PCF8574.create(pcfAddress, i2c);

Register.add("ssr8", pcf.createRegister(0, 7, 0, false));
