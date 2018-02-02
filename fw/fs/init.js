/* global DF, Switch, Timer */

load("api_log.js");
load("api_df.js");
load("api_df_relay.js");
load("api_df_ds18b20.js");

let services = {
	Relay: Relay.create(4, true),
	LED: Relay.create(5, false),
	Temp: DS18B20.create(12)
};

DF.init("DEVICE-FARM", "CR1TS1A", services);
