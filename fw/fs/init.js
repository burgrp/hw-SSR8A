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

let regsCount = Cfg.get("ssr8.regCount");
for (let r = 0; r < regsCount; r++) {
    let cfgPrefix = "ssr8.reg" + chr(48 + r) + ".";
    let name = Cfg.get(cfgPrefix + "name");
    let lsb = Cfg.get(cfgPrefix + "lsb");
    let msb = Cfg.get(cfgPrefix + "msb");
    let def = Cfg.get(cfgPrefix + "def");
    let logic = Cfg.get(cfgPrefix + "logic");
    print("Register", r, name, lsb, msb, def, logic)
    Register.add(name, pcf.createRegister(lsb, msb, def, !logic));
}


