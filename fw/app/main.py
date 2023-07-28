import mqtt_reg
import time
from machine import I2C, Pin, WDT
import gc

import sys
sys.path.append("/")
import site_config
import board_config

print("DO6TS1A")

i2c = I2C(0, scl=Pin(board_config.temp_scl), sda=Pin(board_config.temp_sda), freq=10000)
wifi_led = Pin(board_config.wifi_led_pin, Pin.OUT)

class ChanelRegister(mqtt_reg.ServerRegister):
    def __init__(self, gpio, name, logic, default):

        super().__init__(
            name = name,
            meta = {
                "device": board_config.device_name,
                "type": "number"
            },
            value = default,
        )
        self.pin = Pin(gpio, Pin.OPEN_DRAIN)
        self.logic = logic
        self.set_value(default)

    def set_value(self, value):
        self.value = value
        self.pin.value(1 if value ^ self.logic else 0)




class TempRegister(mqtt_reg.ServerReadOnlyRegister):
    def __init__(self, address, name):

        super().__init__(
            name = name,
            meta = {
                "device": board_config.device_name,
                "type": "number",
                "unit": "°C"
            },
            value = None
        )

        self.address = address

    def read(self):
        temp = i2c.readfrom(self.address, 2)
        temp = (temp[0] << 3) | (temp[1] >> 5)
        mask = 0x400
        temp = (-(temp & mask) + (temp & ~mask)) * 0.125
        self.set_value_local(temp)

channelRegisters = list(map(lambda cfg: ChanelRegister(cfg["gpio"], cfg["name"], cfg.get("logic", True), cfg.get("default", 0)), board_config.channels))
tempRegisters = list(map(lambda cfg: TempRegister(cfg["address"], cfg["name"]), board_config.sensors))

registry = mqtt_reg.Registry(
    wifi_ssid=site_config.wifi_ssid,
    wifi_password=site_config.wifi_password,
    mqtt_broker=site_config.mqtt_broker,
    online_cb= lambda online: wifi_led.value(1 if online else 0),
    debug=board_config.debug,
    server=tempRegisters + channelRegisters
)

registry.start(background=True)

wdt = WDT(timeout=board_config.watchdog_ms)

while True:

    for reg in tempRegisters:
        try:
            reg.read()
        except Exception as e:
            print("Error reading temperature:", e)
            reg.set_value_local(None)


    if board_config.debug:
        print("Free RAM:", gc.mem_free())

    time.sleep_ms(board_config.loop_period_ms)
    wdt.feed()
