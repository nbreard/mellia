EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Thermo/hygro shield"
Date "2021-09-07"
Rev ""
Comp "OpenStudio"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8950 1450 1    60   ~ 0
Vin
Text Label 9350 1450 1    60   ~ 0
IOREF
Text Label 8900 2500 0    60   ~ 0
temp_out
Text Label 8900 2600 0    60   ~ 0
humidity
Text Label 8900 2700 0    60   ~ 0
A2
Text Label 8900 2800 0    60   ~ 0
A3
Text Label 8900 2900 0    60   ~ 0
A4(SDA)
Text Label 8900 3000 0    60   ~ 0
A5(SCL)
Text Label 10550 3000 0    60   ~ 0
0(Rx)
Text Label 10550 2800 0    60   ~ 0
2
Text Label 10550 2900 0    60   ~ 0
1(Tx)
Text Label 10550 2700 0    60   ~ 0
3(**)
Text Label 10550 2600 0    60   ~ 0
4
Text Label 10550 2500 0    60   ~ 0
5(**)
Text Label 10550 2400 0    60   ~ 0
6(**)
Text Label 10550 2300 0    60   ~ 0
7
Text Label 10550 2100 0    60   ~ 0
8
Text Label 10550 2000 0    60   ~ 0
9(**)
Text Label 10550 1900 0    60   ~ 0
10(**/SS)
Text Label 10550 1800 0    60   ~ 0
11(**/MOSI)
Text Label 10550 1700 0    60   ~ 0
12(MISO)
Text Label 10550 1600 0    60   ~ 0
13(SCK)
Text Label 10550 1400 0    60   ~ 0
AREF
NoConn ~ 9400 1600
Text Label 10550 1300 0    60   ~ 0
A4(SDA)
Text Label 10550 1200 0    60   ~ 0
A5(SCL)
Text Notes 10850 1000 0    60   ~ 0
Holes
Text Notes 8550 750  0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L Connector_Generic:Conn_01x08 P1
U 1 1 56D70129
P 9600 1900
F 0 "P1" H 9600 2350 50  0000 C CNN
F 1 "Power" V 9700 1900 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9750 1900 20  0000 C CNN
F 3 "" H 9600 1900 50  0000 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
Text Label 8650 1800 0    60   ~ 0
Reset
$Comp
L power:+3.3V #PWR01
U 1 1 56D70538
P 9150 1450
F 0 "#PWR01" H 9150 1300 50  0001 C CNN
F 1 "+3.3V" V 9150 1700 50  0000 C CNN
F 2 "" H 9150 1450 50  0000 C CNN
F 3 "" H 9150 1450 50  0000 C CNN
	1    9150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 56D707BB
P 9050 1350
F 0 "#PWR02" H 9050 1200 50  0001 C CNN
F 1 "+5V" V 9050 1550 50  0000 C CNN
F 2 "" H 9050 1350 50  0000 C CNN
F 3 "" H 9050 1350 50  0000 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 56D70CC2
P 9300 3150
F 0 "#PWR03" H 9300 2900 50  0001 C CNN
F 1 "GND" H 9300 3000 50  0000 C CNN
F 2 "" H 9300 3150 50  0000 C CNN
F 3 "" H 9300 3150 50  0000 C CNN
	1    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 56D70CFF
P 10300 3150
F 0 "#PWR04" H 10300 2900 50  0001 C CNN
F 1 "GND" H 10300 3000 50  0000 C CNN
F 2 "" H 10300 3150 50  0000 C CNN
F 3 "" H 10300 3150 50  0000 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 56D70DD8
P 9600 2700
F 0 "P2" H 9600 2300 50  0000 C CNN
F 1 "Analog" V 9700 2700 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 9750 2750 20  0000 C CNN
F 3 "" H 9600 2700 50  0000 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D71177
P 10800 650
F 0 "P5" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10721 724 20  0000 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D71274
P 10900 650
F 0 "P6" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10900 650 20  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 56D712A8
P 11000 650
F 0 "P7" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 11000 650 20  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P8
U 1 1 56D712DB
P 11100 650
F 0 "P8" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11024 572 20  0000 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 56D7164F
P 10000 2600
F 0 "P4" H 10000 2100 50  0000 C CNN
F 1 "Digital" V 10100 2600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 10150 2550 20  0000 C CNN
F 3 "" H 10000 2600 50  0000 C CNN
	1    10000 2600
	-1   0    0    -1  
$EndComp
Wire Notes Line
	8525 825  9925 825 
Wire Notes Line
	9925 825  9925 475 
Wire Wire Line
	9350 1450 9350 1700
Wire Wire Line
	9350 1700 9400 1700
Wire Wire Line
	9400 1900 9150 1900
Wire Wire Line
	9400 2000 9050 2000
Wire Wire Line
	9400 2300 8950 2300
Wire Wire Line
	9400 2100 9300 2100
Wire Wire Line
	9400 2200 9300 2200
Connection ~ 9300 2200
Wire Wire Line
	8950 2300 8950 1450
Wire Wire Line
	9050 2000 9050 1350
Wire Wire Line
	9150 1900 9150 1450
Wire Wire Line
	9400 2500 8900 2500
Wire Wire Line
	9400 2600 8900 2600
Wire Wire Line
	9400 2700 8900 2700
Wire Wire Line
	9400 2800 8900 2800
Wire Wire Line
	9400 2900 8900 2900
Wire Wire Line
	9400 3000 8900 3000
$Comp
L Connector_Generic:Conn_01x10 P3
U 1 1 56D721E0
P 10000 1600
F 0 "P3" H 10000 2150 50  0000 C CNN
F 1 "Digital" V 10100 1600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 10150 1600 20  0000 C CNN
F 3 "" H 10000 1600 50  0000 C CNN
	1    10000 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10550 2100
Wire Wire Line
	10200 2000 10550 2000
Wire Wire Line
	10200 1900 10550 1900
Wire Wire Line
	10200 1800 10550 1800
Wire Wire Line
	10200 1700 10550 1700
Wire Wire Line
	10200 1600 10550 1600
Wire Wire Line
	10200 1400 10550 1400
Wire Wire Line
	10200 1300 10550 1300
Wire Wire Line
	10200 1200 10550 1200
Wire Wire Line
	10200 3000 10550 3000
Wire Wire Line
	10200 2900 10550 2900
Wire Wire Line
	10200 2800 10550 2800
Wire Wire Line
	10200 2700 10550 2700
Wire Wire Line
	10200 2600 10550 2600
Wire Wire Line
	10200 2500 10550 2500
Wire Wire Line
	10200 2400 10550 2400
Wire Wire Line
	10200 2300 10550 2300
Wire Wire Line
	10200 1500 10300 1500
Wire Wire Line
	10300 1500 10300 3150
Wire Wire Line
	9300 2100 9300 2200
Wire Wire Line
	9300 2200 9300 3150
Wire Wire Line
	9400 1800 8650 1800
Text Notes 9700 1600 0    60   ~ 0
1
Wire Notes Line
	11200 1000 10700 1000
Wire Notes Line
	10700 1000 10700 500 
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 6137CEFB
P 1850 1100
F 0 "J1" H 1930 1142 50  0000 L CNN
F 1 "Conn_01x05" H 1930 1051 50  0000 L CNN
F 2 "Diode_SMD:D_SMB" H 1850 1100 50  0001 C CNN
F 3 "~" H 1850 1100 50  0001 C CNN
	1    1850 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1000 1400 1000
Wire Wire Line
	1650 1200 1400 1200
Wire Wire Line
	1650 1300 1400 1300
Text Label 1400 1000 0    50   ~ 0
temp_out
Text Label 1400 1200 0    50   ~ 0
humidity
$Comp
L power:+5V #PWR0101
U 1 1 61383949
P 1400 1300
F 0 "#PWR0101" H 1400 1150 50  0001 C CNN
F 1 "+5V" H 1415 1473 50  0000 C CNN
F 2 "" H 1400 1300 50  0001 C CNN
F 3 "" H 1400 1300 50  0001 C CNN
	1    1400 1300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61383DE5
P 1400 900
F 0 "#PWR0102" H 1400 650 50  0001 C CNN
F 1 "GND" H 1405 727 50  0000 C CNN
F 2 "" H 1400 900 50  0001 C CNN
F 3 "" H 1400 900 50  0001 C CNN
	1    1400 900 
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 900  1400 900 
$Comp
L Device:R R1
U 1 1 61396521
P 1250 1000
F 0 "R1" V 1043 1000 50  0000 C CNN
F 1 "10k" V 1134 1000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1180 1000 50  0001 C CNN
F 3 "~" H 1250 1000 50  0001 C CNN
	1    1250 1000
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 61397401
P 1050 800
F 0 "#PWR0103" H 1050 650 50  0001 C CNN
F 1 "+5V" H 1065 973 50  0000 C CNN
F 2 "" H 1050 800 50  0001 C CNN
F 3 "" H 1050 800 50  0001 C CNN
	1    1050 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 800  1050 1000
Wire Wire Line
	1050 1000 1100 1000
Wire Notes Line
	2650 1750 2650 500 
Wire Notes Line
	2650 500  550  500 
Wire Notes Line
	550  500  550  1750
Wire Notes Line
	550  1750 2650 1750
Text Notes 1950 1650 0    50   ~ 0
internal sensor\n
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 6139D19F
P 3650 800
F 0 "J2" V 3614 512 50  0000 R CNN
F 1 "Conn_01x05" V 3523 512 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3650 800 50  0001 C CNN
F 3 "~" H 3650 800 50  0001 C CNN
	1    3650 800 
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0104
U 1 1 6139DE89
P 3000 850
F 0 "#PWR0104" H 3000 700 50  0001 C CNN
F 1 "+3.3V" H 3015 1023 50  0000 C CNN
F 2 "" H 3000 850 50  0001 C CNN
F 3 "" H 3000 850 50  0001 C CNN
	1    3000 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 850  3000 1000
Wire Wire Line
	3000 1000 3450 1000
Wire Wire Line
	3550 1000 3550 1300
Text Label 3550 1300 2    50   ~ 0
A4(SDA)
Wire Wire Line
	3650 1000 3650 1300
Text Label 3650 1300 0    50   ~ 0
A5(SCL)
$Comp
L power:GND #PWR0105
U 1 1 613A88FE
P 3850 1000
F 0 "#PWR0105" H 3850 750 50  0001 C CNN
F 1 "GND" H 3855 827 50  0000 C CNN
F 2 "" H 3850 1000 50  0001 C CNN
F 3 "" H 3850 1000 50  0001 C CNN
	1    3850 1000
	1    0    0    -1  
$EndComp
Wire Notes Line
	2750 600  4800 600 
Wire Notes Line
	4800 600  4800 1750
Wire Notes Line
	4800 1750 2750 1750
Wire Notes Line
	2750 1750 2750 600 
Wire Notes Line
	3700 1250 3650 1250
$Comp
L power:GND #PWR0106
U 1 1 613CA368
P 1150 1300
F 0 "#PWR0106" H 1150 1050 50  0001 C CNN
F 1 "GND" H 1155 1127 50  0000 C CNN
F 2 "" H 1150 1300 50  0001 C CNN
F 3 "" H 1150 1300 50  0001 C CNN
	1    1150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1300 1150 1100
Wire Wire Line
	1150 1100 1650 1100
$Comp
L Device:D D1
U 1 1 613DDB33
P 2200 2850
F 0 "D1" H 2200 2633 50  0000 C CNN
F 1 "D" H 2200 2724 50  0000 C CNN
F 2 "Diode_SMD:D_SMB" H 2200 2850 50  0001 C CNN
F 3 "~" H 2200 2850 50  0001 C CNN
	1    2200 2850
	-1   0    0    1   
$EndComp
$Comp
L Connector:Barrel_Jack_MountingPin J3
U 1 1 613DFF87
P 1500 2950
F 0 "J3" H 1557 3267 50  0000 C CNN
F 1 "Barrel_Jack_MountingPin" H 1557 3176 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 1550 2910 50  0001 C CNN
F 3 "~" H 1550 2910 50  0001 C CNN
	1    1500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2850 2050 2850
Wire Wire Line
	1800 3050 1800 3150
Wire Wire Line
	1800 3250 1500 3250
Wire Wire Line
	2350 2850 2650 2850
Text Label 2650 2850 0    50   ~ 0
Vin
$Comp
L power:GND #PWR0107
U 1 1 613E92A8
P 1800 3300
F 0 "#PWR0107" H 1800 3050 50  0001 C CNN
F 1 "GND" H 1805 3127 50  0000 C CNN
F 2 "" H 1800 3300 50  0001 C CNN
F 3 "" H 1800 3300 50  0001 C CNN
	1    1800 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3250 1800 3300
Connection ~ 1800 3250
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 613887E2
P 2250 3050
F 0 "J4" H 2278 3026 50  0000 L CNN
F 1 "Conn_01x02_Female" H 2278 2935 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2250 3050 50  0001 C CNN
F 3 "~" H 2250 3050 50  0001 C CNN
	1    2250 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 3050 2050 2850
Connection ~ 2050 2850
Wire Wire Line
	2050 3150 1800 3150
Connection ~ 1800 3150
Wire Wire Line
	1800 3150 1800 3250
$Comp
L RF_LoRa_E5:LoRa-E5 U1
U 1 1 613B519B
P 2800 5550
F 0 "U1" H 3544 5596 50  0000 L CNN
F 1 "LoRa-E5" H 3544 5505 50  0000 L CNN
F 2 "LoRa-E5_kicad:LoRa-E5" H 2800 5550 50  0001 C CNN
F 3 "" H 2800 5550 50  0001 C CNN
	1    2800 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 613B6FD8
P 1400 5050
F 0 "C1" H 1515 5096 50  0000 L CNN
F 1 "4.7uF" H 1515 5005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1438 4900 50  0001 C CNN
F 3 "~" H 1400 5050 50  0001 C CNN
	1    1400 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0108
U 1 1 613B9FB9
P 1400 4700
F 0 "#PWR0108" H 1400 4550 50  0001 C CNN
F 1 "+3.3V" H 1415 4873 50  0000 C CNN
F 2 "" H 1400 4700 50  0001 C CNN
F 3 "" H 1400 4700 50  0001 C CNN
	1    1400 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5250 1800 5250
$Comp
L power:GND #PWR0109
U 1 1 613C5384
P 1400 5200
F 0 "#PWR0109" H 1400 4950 50  0001 C CNN
F 1 "GND" H 1405 5027 50  0000 C CNN
F 2 "" H 1400 5200 50  0001 C CNN
F 3 "" H 1400 5200 50  0001 C CNN
	1    1400 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 4700 1400 4900
Wire Wire Line
	1400 4900 1800 4900
Wire Wire Line
	1800 4900 1800 5250
Connection ~ 1400 4900
Wire Wire Line
	2100 5350 1600 5350
Wire Wire Line
	1600 5350 1600 5200
Wire Wire Line
	1600 5200 1400 5200
Connection ~ 1400 5200
Text Label 4250 5250 0    50   ~ 0
Reset
$Comp
L Device:R R4
U 1 1 613DB737
P 4000 5650
F 0 "R4" V 3793 5650 50  0000 C CNN
F 1 "22" V 3884 5650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3930 5650 50  0001 C CNN
F 3 "~" H 4000 5650 50  0001 C CNN
	1    4000 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 5650 3850 5650
Wire Wire Line
	4150 5650 4250 5650
Wire Wire Line
	4250 5650 4250 5250
$Comp
L Device:R R2
U 1 1 613E8A52
P 2600 6500
F 0 "R2" H 2450 6550 50  0000 L CNN
F 1 "22" H 2450 6450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2530 6500 50  0001 C CNN
F 3 "~" H 2600 6500 50  0001 C CNN
	1    2600 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 613E9D96
P 2700 6500
F 0 "R3" H 2750 6550 50  0000 L CNN
F 1 "22" H 2750 6450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2630 6500 50  0001 C CNN
F 3 "~" H 2700 6500 50  0001 C CNN
	1    2700 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6250 2700 6350
Wire Wire Line
	2600 6250 2600 6350
Wire Wire Line
	2600 6650 2600 6900
Text Label 2600 6900 2    50   ~ 0
1(Tx)
Wire Wire Line
	2700 6650 2700 6900
Text Label 2700 6900 0    50   ~ 0
0(Rx)
$Comp
L power:GND #PWR0110
U 1 1 61407BEA
P 3100 6600
F 0 "#PWR0110" H 3100 6350 50  0001 C CNN
F 1 "GND" H 3105 6427 50  0000 C CNN
F 2 "" H 3100 6600 50  0001 C CNN
F 3 "" H 3100 6600 50  0001 C CNN
	1    3100 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 61408532
P 4100 5850
F 0 "#PWR0111" H 4100 5600 50  0001 C CNN
F 1 "GND" H 4105 5677 50  0000 C CNN
F 2 "" H 4100 5850 50  0001 C CNN
F 3 "" H 4100 5850 50  0001 C CNN
	1    4100 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5750 4100 5750
Wire Wire Line
	4100 5750 4100 5850
Wire Wire Line
	3100 6250 3100 6600
Wire Wire Line
	3500 5850 3900 5850
Wire Wire Line
	3900 5850 3900 6350
Wire Wire Line
	3900 6350 4550 6350
$Comp
L Device:C C2
U 1 1 614119D2
P 4550 6500
F 0 "C2" H 4665 6546 50  0000 L CNN
F 1 "C" H 4665 6455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4588 6350 50  0001 C CNN
F 3 "~" H 4550 6500 50  0001 C CNN
	1    4550 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 61412039
P 4850 6500
F 0 "C3" H 4965 6546 50  0000 L CNN
F 1 "C" H 4965 6455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4888 6350 50  0001 C CNN
F 3 "~" H 4850 6500 50  0001 C CNN
	1    4850 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 614128C5
P 4700 6350
F 0 "L1" V 4890 6350 50  0000 C CNN
F 1 "L" V 4799 6350 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.05x1.20mm_HandSolder" H 4700 6350 50  0001 C CNN
F 3 "~" H 4700 6350 50  0001 C CNN
	1    4700 6350
	0    -1   -1   0   
$EndComp
Connection ~ 4550 6350
Wire Wire Line
	4850 6350 5300 6350
Connection ~ 4850 6350
Wire Wire Line
	4550 6650 4700 6650
$Comp
L power:GND #PWR0112
U 1 1 6141B966
P 4700 6800
F 0 "#PWR0112" H 4700 6550 50  0001 C CNN
F 1 "GND" H 4705 6627 50  0000 C CNN
F 2 "" H 4700 6800 50  0001 C CNN
F 3 "" H 4700 6800 50  0001 C CNN
	1    4700 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 6800 4700 6650
Connection ~ 4700 6650
Wire Wire Line
	4700 6650 4850 6650
$Comp
L Connector:Conn_Coaxial J5
U 1 1 614241F7
P 5500 6350
F 0 "J5" H 5600 6325 50  0000 L CNN
F 1 "Conn_Coaxial" H 5600 6234 50  0000 L CNN
F 2 "Connector_Coaxial:U.FL_Hirose_U.FL-R-SMT-1_Vertical" H 5500 6350 50  0001 C CNN
F 3 " ~" H 5500 6350 50  0001 C CNN
	1    5500 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 6650 5500 6550
Connection ~ 4850 6650
Wire Wire Line
	4850 6650 5500 6650
Wire Notes Line
	600  1900 3500 1900
Wire Notes Line
	3500 1900 3500 4000
Wire Notes Line
	3500 4000 600  4000
Wire Notes Line
	600  4000 600  1900
Wire Notes Line
	8500 3450 11200 3450
Wire Notes Line
	8500 500  8500 3450
Wire Notes Line
	6500 4250 6500 7300
Wire Notes Line
	6500 7300 800  7300
Wire Notes Line
	800  7300 800  4250
Wire Notes Line
	800  4250 6500 4250
$EndSCHEMATC