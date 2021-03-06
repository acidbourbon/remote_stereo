EESchema Schematic File Version 2  date Di 18 Feb 2014 10:07:29 CET
LIBS:power
LIBS:usbamp-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 2 3
Title ""
Date "27 sep 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TLC274 U201
U 1 1 51DBFDBC
P 2500 2450
F 0 "U201" H 2550 2650 60  0000 C CNN
F 1 "TLC274" H 2650 2250 50  0000 C CNN
	1    2500 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 5650 1500 5650
Wire Wire Line
	5550 5900 5900 5900
Connection ~ 6100 5500
Wire Wire Line
	6300 5500 6300 3650
Wire Wire Line
	1900 1600 2200 1600
Wire Wire Line
	5900 5500 5900 5250
Wire Wire Line
	5650 1600 5650 3800
Wire Wire Line
	5650 3800 5200 3800
Wire Wire Line
	3600 1600 3600 3800
Wire Wire Line
	3600 3800 3700 3800
Connection ~ 7050 3950
Wire Wire Line
	7050 2350 7050 4750
Wire Wire Line
	3450 5150 3450 4000
Wire Wire Line
	3450 4000 3700 4000
Connection ~ 3550 4100
Wire Wire Line
	3700 3600 3550 3600
Wire Wire Line
	3550 3600 3550 4900
Connection ~ 5300 4100
Wire Wire Line
	5300 3600 5300 4900
Wire Wire Line
	5300 4100 5200 4100
Wire Wire Line
	5300 3600 5200 3600
Connection ~ 6300 3150
Wire Wire Line
	6550 3150 5800 3150
Wire Wire Line
	5800 3150 5800 4600
Wire Wire Line
	5800 4600 3600 4600
Wire Wire Line
	3600 4600 3600 4200
Wire Wire Line
	3600 4200 3700 4200
Wire Wire Line
	3700 3400 3200 3400
Wire Wire Line
	3200 3400 3200 4850
Wire Wire Line
	3200 4850 3000 4850
Wire Wire Line
	3700 4300 3300 4300
Wire Wire Line
	3300 4300 3300 3250
Wire Wire Line
	3300 3250 3000 3250
Wire Wire Line
	3800 6600 5600 6600
Wire Wire Line
	5600 6600 5600 6850
Connection ~ 4400 6600
Wire Wire Line
	4400 6850 4400 6600
Wire Wire Line
	1900 1100 2200 1100
Wire Wire Line
	2200 2850 2000 2850
Wire Wire Line
	2000 2850 2000 2550
Wire Wire Line
	2700 2850 3000 2850
Wire Wire Line
	3000 2850 3000 2450
Wire Wire Line
	3000 3250 3000 3650
Wire Wire Line
	3000 3650 2700 3650
Wire Wire Line
	2000 3350 2000 3650
Wire Wire Line
	2000 3650 2200 3650
Wire Wire Line
	2200 5250 2000 5250
Wire Wire Line
	2000 5250 2000 4950
Wire Wire Line
	2700 5250 3000 5250
Wire Wire Line
	3000 5250 3000 4850
Wire Wire Line
	3000 4450 3000 4050
Wire Wire Line
	3000 4450 2700 4450
Wire Wire Line
	2000 4150 2000 4450
Wire Wire Line
	2000 4450 2200 4450
Wire Wire Line
	1900 1350 2200 1350
Wire Wire Line
	4400 7250 4400 7500
Connection ~ 4400 7500
Wire Wire Line
	3800 7500 5600 7500
Wire Wire Line
	5600 7500 5600 7250
Wire Wire Line
	3000 2450 5600 2450
Wire Wire Line
	5600 2450 5600 4300
Wire Wire Line
	5600 4300 5200 4300
Wire Wire Line
	3000 4050 3150 4050
Wire Wire Line
	3150 4050 3150 4650
Wire Wire Line
	3150 4650 5550 4650
Wire Wire Line
	5550 4650 5550 3400
Wire Wire Line
	5550 3400 5200 3400
Wire Wire Line
	5200 4200 5950 4200
Wire Wire Line
	5950 4200 5950 2350
Wire Wire Line
	5950 2350 6550 2350
Connection ~ 6500 2350
Wire Wire Line
	5200 3500 5700 3500
Wire Wire Line
	5700 3500 5700 3950
Wire Wire Line
	5700 3950 6550 3950
Connection ~ 6100 3950
Wire Wire Line
	3550 4100 3700 4100
Wire Wire Line
	5300 4900 3550 4900
Wire Wire Line
	3700 3500 3500 3500
Wire Wire Line
	3500 3500 3500 4750
Wire Wire Line
	3500 4750 6550 4750
Connection ~ 5900 4750
Wire Wire Line
	5200 3700 5350 3700
Wire Wire Line
	5350 3700 5350 3250
Connection ~ 7050 3150
Wire Wire Line
	7050 3550 7800 3550
Connection ~ 7050 3550
Wire Wire Line
	3700 3900 3450 3900
Wire Wire Line
	3450 3900 3450 1600
Wire Wire Line
	3700 3700 3650 3700
Wire Wire Line
	3650 3700 3650 2350
Wire Wire Line
	3650 2350 5400 2350
Wire Wire Line
	5400 2350 5400 1600
Connection ~ 5900 5900
Wire Wire Line
	6100 5500 6100 4450
Wire Wire Line
	6500 2850 6500 5500
Connection ~ 6300 5500
Wire Wire Line
	6500 5500 5750 5500
Connection ~ 5900 5500
Connection ~ 1500 5650
Connection ~ 1500 6050
Wire Wire Line
	1150 6050 1500 6050
Text Notes 900  6250 0    60   ~ 0
buffer auxGnd on every quad amp
Text Label 1350 5650 2    60   ~ 0
auxGnd
$Comp
L C C205
U 1 1 51DC1D10
P 1500 5850
F 0 "C205" H 1550 5950 50  0000 L CNN
F 1 "100n" H 1550 5750 50  0000 L CNN
	1    1500 5850
	1    0    0    -1  
$EndComp
Text Label 1150 6050 0    60   ~ 0
gnd
Text HLabel 1900 1600 0    60   BiDi ~ 0
gnd
Text Label 2200 1600 0    60   ~ 0
gnd
Text Notes 6250 5750 0    60   ~ 0
for safety issues, buffer the auxGnd here
Text Label 5550 5900 0    60   ~ 0
gnd
$Comp
L C C208
U 1 1 51DC1157
P 5900 5700
F 0 "C208" H 5950 5800 50  0000 L CNN
F 1 "100n" H 5950 5600 50  0000 L CNN
	1    5900 5700
	1    0    0    -1  
$EndComp
Text Notes 5950 7050 0    60   ~ 0
buffer cap for digital pot\n
Text Notes 3300 1200 0    60   ~ 0
I2C data io
Text Notes 5300 1100 0    60   ~ 0
address bits\nto distinguish between the \ndigital pot chips
Text Notes 7250 2700 0    60   ~ 0
passive mixer,\n1k resistors + 10k lin pots\nto fake log pots
Text Notes 1900 1900 0    60   ~ 0
inverting input stages,\ndecoupling caps,\nimpedance 10k
Text Notes 3850 3000 0    60   ~ 0
4x digital potentiometer 10k
Text HLabel 5650 1600 1    60   Input ~ 0
a1
Text HLabel 5400 1600 1    60   Input ~ 0
a0
Text HLabel 7800 3550 2    60   Output ~ 0
mix
Text Label 5400 1900 2    60   ~ 0
a0
Text Label 5650 1900 0    60   ~ 0
a1
Text HLabel 3600 1600 1    60   BiDi ~ 0
scl
Text HLabel 3450 1600 1    60   BiDi ~ 0
sda
$Comp
L R R215
U 1 1 51DC1D0E
P 6800 3950
F 0 "R215" V 6880 3950 50  0000 C CNN
F 1 "10k" V 6800 3950 50  0000 C CNN
	1    6800 3950
	0    1    1    0   
$EndComp
$Comp
L R R216
U 1 1 51DC1D0D
P 6800 4750
F 0 "R216" V 6880 4750 50  0000 C CNN
F 1 "10k" V 6800 4750 50  0000 C CNN
	1    6800 4750
	0    1    1    0   
$EndComp
$Comp
L R R214
U 1 1 51DC1D0C
P 6800 3150
F 0 "R214" V 6880 3150 50  0000 C CNN
F 1 "10k" V 6800 3150 50  0000 C CNN
	1    6800 3150
	0    1    1    0   
$EndComp
$Comp
L R R213
U 1 1 51DC1D0B
P 6800 2350
F 0 "R213" V 6880 2350 50  0000 C CNN
F 1 "10k" V 6800 2350 50  0000 C CNN
	1    6800 2350
	0    1    1    0   
$EndComp
Text Label 5350 3250 0    60   ~ 0
vcc
Text Label 3450 5150 0    60   ~ 0
gnd
Text Label 4600 4900 2    60   ~ 0
auxGnd
$Comp
L R R210
U 1 1 51DC1D0A
P 6100 4200
F 0 "R210" V 6180 4200 50  0000 C CNN
F 1 "1k" V 6100 4200 50  0000 C CNN
	1    6100 4200
	1    0    0    -1  
$EndComp
Text Label 5750 5500 2    60   ~ 0
auxGnd
$Comp
L R R209
U 1 1 51DC08CF
P 5900 5000
F 0 "R209" V 5980 5000 50  0000 C CNN
F 1 "1k" V 5900 5000 50  0000 C CNN
	1    5900 5000
	1    0    0    -1  
$EndComp
$Comp
L R R211
U 1 1 51DC1D08
P 6300 3400
F 0 "R211" V 6380 3400 50  0000 C CNN
F 1 "1k" V 6300 3400 50  0000 C CNN
	1    6300 3400
	1    0    0    -1  
$EndComp
$Comp
L R R212
U 1 1 51DC1D07
P 6500 2600
F 0 "R212" V 6580 2600 50  0000 C CNN
F 1 "1k" V 6500 2600 50  0000 C CNN
	1    6500 2600
	1    0    0    -1  
$EndComp
$Comp
L C C207
U 1 1 51DC1D06
P 5600 7050
F 0 "C207" H 5650 7150 50  0000 L CNN
F 1 "100n" H 5650 6950 50  0000 L CNN
	1    5600 7050
	1    0    0    -1  
$EndComp
$Comp
L C C206
U 1 1 51DC1D05
P 4400 7050
F 0 "C206" H 4450 7150 50  0000 L CNN
F 1 "100n" H 4450 6950 50  0000 L CNN
	1    4400 7050
	1    0    0    -1  
$EndComp
Text Label 3800 7500 0    60   ~ 0
gnd
Text Label 3800 6600 0    60   ~ 0
vcc
Text Label 2200 1350 0    60   ~ 0
auxGnd
Text Label 2200 1100 0    60   ~ 0
vcc
$Comp
L TLC274 U201
U 3 1 51DC1D04
P 2500 4050
F 0 "U201" H 2550 4250 60  0000 C CNN
F 1 "TLC274" H 2650 3850 50  0000 C CNN
	3    2500 4050
	1    0    0    -1  
$EndComp
$Comp
L C C203
U 1 1 51DC03C2
P 1300 4150
F 0 "C203" H 1350 4250 50  0000 L CNN
F 1 "1uF" H 1350 4050 50  0000 L CNN
	1    1300 4150
	0    1    1    0   
$EndComp
$Comp
L R R203
U 1 1 51DC03C1
P 1750 4150
F 0 "R203" V 1830 4150 50  0000 C CNN
F 1 "10k" V 1750 4150 50  0000 C CNN
	1    1750 4150
	0    1    1    0   
$EndComp
$Comp
L R R207
U 1 1 51DC03C0
P 2450 4450
F 0 "R207" V 2530 4450 50  0000 C CNN
F 1 "10k" V 2450 4450 50  0000 C CNN
	1    2450 4450
	0    1    1    0   
$EndComp
Text Label 2000 3950 2    60   ~ 0
auxGnd
Text Label 2000 4750 2    60   ~ 0
auxGnd
$Comp
L R R208
U 1 1 51DC03BF
P 2450 5250
F 0 "R208" V 2530 5250 50  0000 C CNN
F 1 "10k" V 2450 5250 50  0000 C CNN
	1    2450 5250
	0    1    1    0   
$EndComp
$Comp
L R R204
U 1 1 51DC03BE
P 1750 4950
F 0 "R204" V 1830 4950 50  0000 C CNN
F 1 "10k" V 1750 4950 50  0000 C CNN
	1    1750 4950
	0    1    1    0   
$EndComp
$Comp
L C C204
U 1 1 51DC03BD
P 1300 4950
F 0 "C204" H 1350 5050 50  0000 L CNN
F 1 "1uF" H 1350 4850 50  0000 L CNN
	1    1300 4950
	0    1    1    0   
$EndComp
$Comp
L TLC274 U201
U 4 1 51DC03BC
P 2500 4850
F 0 "U201" H 2550 5050 60  0000 C CNN
F 1 "TLC274" H 2650 4650 50  0000 C CNN
	4    2500 4850
	1    0    0    -1  
$EndComp
$Comp
L TLC274 U201
U 2 1 51DC03B0
P 2500 3250
F 0 "U201" H 2550 3450 60  0000 C CNN
F 1 "TLC274" H 2650 3050 50  0000 C CNN
	2    2500 3250
	1    0    0    -1  
$EndComp
$Comp
L C C202
U 1 1 51DC1CFB
P 1300 3350
F 0 "C202" H 1350 3450 50  0000 L CNN
F 1 "1uF" H 1350 3250 50  0000 L CNN
	1    1300 3350
	0    1    1    0   
$EndComp
$Comp
L R R202
U 1 1 51DC1CFA
P 1750 3350
F 0 "R202" V 1830 3350 50  0000 C CNN
F 1 "10k" V 1750 3350 50  0000 C CNN
	1    1750 3350
	0    1    1    0   
$EndComp
$Comp
L R R206
U 1 1 51DC1CF9
P 2450 3650
F 0 "R206" V 2530 3650 50  0000 C CNN
F 1 "10k" V 2450 3650 50  0000 C CNN
	1    2450 3650
	0    1    1    0   
$EndComp
Text Label 2000 3150 2    60   ~ 0
auxGnd
$Comp
L MCP4461 U202
U 1 1 51DC034F
P 4450 3850
F 0 "U202" H 4250 4400 50  0000 C CNN
F 1 "MCP4461" H 4550 4400 50  0000 C CNN
F 2 "I2C" H 4300 3850 50  0001 C CNN
F 3 "Quad_Potentiometers" H 4450 3250 50  0001 C CNN
	1    4450 3850
	1    0    0    -1  
$EndComp
Text Label 2000 2350 2    60   ~ 0
auxGnd
$Comp
L R R205
U 1 1 51DBFE94
P 2450 2850
F 0 "R205" V 2530 2850 50  0000 C CNN
F 1 "10k" V 2450 2850 50  0000 C CNN
	1    2450 2850
	0    1    1    0   
$EndComp
$Comp
L R R201
U 1 1 51DBFE7A
P 1750 2550
F 0 "R201" V 1830 2550 50  0000 C CNN
F 1 "10k" V 1750 2550 50  0000 C CNN
	1    1750 2550
	0    1    1    0   
$EndComp
$Comp
L C C201
U 1 1 51DBFE55
P 1300 2550
F 0 "C201" H 1350 2650 50  0000 L CNN
F 1 "1uF" H 1350 2450 50  0000 L CNN
	1    1300 2550
	0    1    1    0   
$EndComp
$Comp
L TLC274 U201
U 5 1 51DBFDD9
P 3900 7050
F 0 "U201" H 3950 7250 60  0000 C CNN
F 1 "TLC274" H 4050 6850 50  0000 C CNN
	5    3900 7050
	1    0    0    -1  
$EndComp
Text HLabel 1900 1350 0    60   BiDi ~ 0
auxGnd
Text HLabel 1900 1100 0    60   BiDi ~ 0
vcc
Text HLabel 1100 4950 0    60   Input ~ 0
in_4
Text HLabel 1100 4150 0    60   Input ~ 0
in_3
Text HLabel 1100 3350 0    60   Input ~ 0
in_2
Text HLabel 1100 2550 0    60   Input ~ 0
in_1
$EndSCHEMATC
