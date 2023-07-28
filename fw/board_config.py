device_name = "ssr8"

debug=True
wifi_led_pin=1

loop_period_ms=1000
watchdog_ms=10000

temp_sda=2
temp_scl=3

channels = [
    {
        "gpio": 4,
        "name": "test.channel.0"
    },
    {
        "gpio": 5,
        "name": "test.channel.1"
    },
    {
        "gpio": 6,
        "name": "test.channel.2"
    },
    {
        "gpio": 7,
        "name": "test.channel.3"
    },
    {
        "gpio": 8,
        "name": "test.channel.4"
    },
    {
        "gpio": 10,
        "name": "test.channel.5"
    },
    {
        "gpio": 20,
        "name": "test.channel.6"
    },
    {
        "gpio": 21,
        "name": "test.channel.7"
    }
]

sensors = [
    {
        "address": 79,
        "name": "test.temp.0"
    }
]
