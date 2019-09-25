/* global RegisterGPO, Register, RegisterDS18B20 */

load('api_config.js');
load("api_gpio.js");
load("api_timer.js");
load("api_i2c.js");

load("api_df_reg.js");
load("api_df_reg_gpo.js");
load("api_df_reg_pcf8574.js");
load("api_df_reboot.js");

Reboot.after(10);

let i2c = I2C.get();

let ledName = Cfg.get("ssr8.led.name");
if (ledName) {
    let ledPin = Cfg.get("ssr8.led.pin");
    print("LED", ledName, "at pin", ledPin);
    Register.add(ledName, RegisterGPO.create(ledPin));
}

let pcfAddress = Cfg.get("ssr8.pcf8574");
print("PCF8574 address", pcfAddress);
let pcf = PCF8574.create(pcfAddress, i2c);

for (let r = 0; r < 8; r++) {
    let cfgPrefix = "ssr8.reg" + chr(48 + r) + ".";
    let name = Cfg.get(cfgPrefix + "name");
    if (name) {
        let lsb = Cfg.get(cfgPrefix + "lsb");
        let msb = Cfg.get(cfgPrefix + "msb");
        let def = Cfg.get(cfgPrefix + "def");
        let logic = Cfg.get(cfgPrefix + "logic");
        print("Register", r, name, lsb, msb, def, logic)
        Register.add(name, pcf.createRegister(lsb, msb, def, !logic));
    }
}
