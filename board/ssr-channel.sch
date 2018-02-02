EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:device.farm
LIBS:SSR8A-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 10
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L G3MB-SSR U6
U 1 1 59EF82DB
P 4650 2250
AR Path="/59EF8064/59EF82DB" Ref="U6"  Part="1" 
AR Path="/59F10DAA/59EF82DB" Ref="U7"  Part="1" 
AR Path="/59F112F3/59EF82DB" Ref="U8"  Part="1" 
AR Path="/59F11FA1/59EF82DB" Ref="U9"  Part="1" 
AR Path="/59F124DB/59EF82DB" Ref="U10"  Part="1" 
AR Path="/59F12871/59EF82DB" Ref="U11"  Part="1" 
AR Path="/59F130A5/59EF82DB" Ref="U12"  Part="1" 
AR Path="/59F13453/59EF82DB" Ref="U13"  Part="1" 
F 0 "U7" H 4650 2550 60  0000 C CNN
F 1 "G3MB-SSR" H 4650 1950 60  0000 C CNN
F 2 "device.farm:G3MB-SSR" H 4650 2250 60  0001 C CNN
F 3 "" H 4650 2250 60  0001 C CNN
	1    4650 2250
	1    0    0    -1  
$EndComp
Text HLabel 3650 2350 0    60   BiDi ~ 0
5V
$Comp
L R R12
U 1 1 59F0F5EE
P 3900 2350
AR Path="/59EF8064/59F0F5EE" Ref="R12"  Part="1" 
AR Path="/59F10DAA/59F0F5EE" Ref="R13"  Part="1" 
AR Path="/59F112F3/59F0F5EE" Ref="R14"  Part="1" 
AR Path="/59F11FA1/59F0F5EE" Ref="R15"  Part="1" 
AR Path="/59F124DB/59F0F5EE" Ref="R16"  Part="1" 
AR Path="/59F12871/59F0F5EE" Ref="R17"  Part="1" 
AR Path="/59F130A5/59F0F5EE" Ref="R18"  Part="1" 
AR Path="/59F13453/59F0F5EE" Ref="R19"  Part="1" 
F 0 "R13" V 3980 2350 50  0000 C CNN
F 1 "270R" V 3800 2350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3830 2350 50  0001 C CNN
F 3 "" H 3900 2350 50  0001 C CNN
	1    3900 2350
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02 OUT1
U 1 1 59F0F71A
P 5300 1950
AR Path="/59EF8064/59F0F71A" Ref="OUT1"  Part="1" 
AR Path="/59F10DAA/59F0F71A" Ref="OUT2"  Part="1" 
AR Path="/59F112F3/59F0F71A" Ref="OUT3"  Part="1" 
AR Path="/59F11FA1/59F0F71A" Ref="OUT4"  Part="1" 
AR Path="/59F124DB/59F0F71A" Ref="OUT5"  Part="1" 
AR Path="/59F12871/59F0F71A" Ref="OUT6"  Part="1" 
AR Path="/59F130A5/59F0F71A" Ref="OUT7"  Part="1" 
AR Path="/59F13453/59F0F71A" Ref="OUT8"  Part="1" 
F 0 "OUT2" H 5300 2050 50  0000 C CNN
F 1 "Conn_01x02" H 5300 1750 50  0000 C CNN
F 2 "device.farm:DG301-5.0-02" H 5300 1950 50  0001 C CNN
F 3 "" H 5300 1950 50  0001 C CNN
	1    5300 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 2350 4150 2350
Wire Wire Line
	3650 2350 3750 2350
Text HLabel 5650 1800 2    60   BiDi ~ 0
MAINS-L
Text HLabel 5650 2150 2    60   BiDi ~ 0
MAINS-N
Text HLabel 3650 2650 0    60   BiDi ~ 0
/SW
Wire Wire Line
	5150 2350 5300 2350
Wire Wire Line
	5150 2150 5300 2150
Wire Wire Line
	5650 2150 5400 2150
Wire Wire Line
	5650 1800 4150 1800
Wire Wire Line
	4150 1800 4150 2150
Wire Wire Line
	3650 2650 5300 2650
Wire Wire Line
	5300 2650 5300 2350
$EndSCHEMATC
