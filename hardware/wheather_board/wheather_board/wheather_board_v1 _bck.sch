EESchema Schematic File Version 4
LIBS:wheather_board_v1 -cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:C C?
U 1 1 61C1E3F8
P 950 1100
F 0 "C?" H 1065 1146 50  0000 L CNN
F 1 "100 nF" H 1065 1055 50  0000 L CNN
F 2 "" H 988 950 50  0001 C CNN
F 3 "~" H 950 1100 50  0001 C CNN
	1    950  1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C1E469
P 1300 1100
F 0 "C?" H 1415 1146 50  0000 L CNN
F 1 "100nF" H 1415 1055 50  0000 L CNN
F 2 "" H 1338 950 50  0001 C CNN
F 3 "~" H 1300 1100 50  0001 C CNN
	1    1300 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C1E54F
P 1650 1100
F 0 "C?" H 1765 1146 50  0000 L CNN
F 1 "100nF" H 1765 1055 50  0000 L CNN
F 2 "" H 1688 950 50  0001 C CNN
F 3 "~" H 1650 1100 50  0001 C CNN
	1    1650 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C1E598
P 2000 1100
F 0 "C?" H 2115 1146 50  0000 L CNN
F 1 "100nF" H 2115 1055 50  0000 L CNN
F 2 "" H 2038 950 50  0001 C CNN
F 3 "~" H 2000 1100 50  0001 C CNN
	1    2000 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C1E5DC
P 2500 1100
F 0 "C?" H 2615 1146 50  0000 L CNN
F 1 "100nF" H 2615 1055 50  0000 L CNN
F 2 "" H 2538 950 50  0001 C CNN
F 3 "~" H 2500 1100 50  0001 C CNN
	1    2500 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  950  1300 950 
Wire Wire Line
	1650 950  1300 950 
Connection ~ 1300 950 
Wire Wire Line
	1650 950  2000 950 
Connection ~ 1650 950 
Wire Wire Line
	950  900  950  950 
Connection ~ 950  950 
$Comp
L power:+3.3V #PWR?
U 1 1 61C1E86B
P 950 900
F 0 "#PWR?" H 950 750 50  0001 C CNN
F 1 "+3.3V" H 965 1073 50  0000 C CNN
F 2 "" H 950 900 50  0001 C CNN
F 3 "" H 950 900 50  0001 C CNN
	1    950  900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1250 1300 1250
Wire Wire Line
	1300 1250 1650 1250
Connection ~ 1300 1250
Wire Wire Line
	2000 1250 1650 1250
Connection ~ 1650 1250
Wire Wire Line
	2500 950  2500 800 
$Comp
L power:+3.3VA #PWR?
U 1 1 61C1EF9F
P 2500 800
F 0 "#PWR?" H 2500 650 50  0001 C CNN
F 1 "+3.3VA" H 2515 973 50  0000 C CNN
F 2 "" H 2500 800 50  0001 C CNN
F 3 "" H 2500 800 50  0001 C CNN
	1    2500 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 61C1F02C
P 2500 1250
F 0 "#PWR?" H 2500 1000 50  0001 C CNN
F 1 "GNDA" H 2505 1077 50  0000 C CNN
F 2 "" H 2500 1250 50  0001 C CNN
F 3 "" H 2500 1250 50  0001 C CNN
	1    2500 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L?
U 1 1 61C1F1DB
P 2250 950
F 0 "L?" V 2475 950 50  0000 C CNN
F 1 "L_Core_Ferrite" V 2384 950 50  0000 C CNN
F 2 "" H 2250 950 50  0001 C CNN
F 3 "~" H 2250 950 50  0001 C CNN
	1    2250 950 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2400 950  2500 950 
Connection ~ 2500 950 
Wire Wire Line
	2100 950  2000 950 
Connection ~ 2000 950 
$Comp
L Regulator_Linear:LD1117S50TR_SOT223 U?
U 1 1 61C1F3FD
P 1300 2050
F 0 "U?" H 1300 2292 50  0000 C CNN
F 1 "LD1117S50TR_SOT223" H 1300 2201 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 1300 2250 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 1400 1800 50  0001 C CNN
	1    1300 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  1900 700  2050
Wire Wire Line
	700  2050 850  2050
$Comp
L Device:CP C?
U 1 1 61C1F876
P 850 2200
F 0 "C?" H 968 2246 50  0000 L CNN
F 1 "10uF" H 968 2155 50  0000 L CNN
F 2 "" H 888 2050 50  0001 C CNN
F 3 "~" H 850 2200 50  0001 C CNN
	1    850  2200
	1    0    0    -1  
$EndComp
Connection ~ 850  2050
Wire Wire Line
	850  2050 1000 2050
$Comp
L Device:CP C?
U 1 1 61C1F8DA
P 1800 2200
F 0 "C?" H 1918 2246 50  0000 L CNN
F 1 "10uF" H 1918 2155 50  0000 L CNN
F 2 "" H 1838 2050 50  0001 C CNN
F 3 "~" H 1800 2200 50  0001 C CNN
	1    1800 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2050 1800 2050
Wire Wire Line
	850  2350 1300 2350
Wire Wire Line
	1300 2350 1800 2350
Connection ~ 1300 2350
$Comp
L power:VCC #PWR?
U 1 1 61C20081
P 700 1900
F 0 "#PWR?" H 700 1750 50  0001 C CNN
F 1 "VCC" H 715 2073 50  0000 C CNN
F 2 "" H 700 1900 50  0001 C CNN
F 3 "" H 700 1900 50  0001 C CNN
	1    700  1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C20431
P 1300 1250
F 0 "#PWR?" H 1300 1000 50  0001 C CNN
F 1 "GND" H 1305 1077 50  0000 C CNN
F 2 "" H 1300 1250 50  0001 C CNN
F 3 "" H 1300 1250 50  0001 C CNN
	1    1300 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C2046E
P 1300 2350
F 0 "#PWR?" H 1300 2100 50  0001 C CNN
F 1 "GND" H 1305 2177 50  0000 C CNN
F 2 "" H 1300 2350 50  0001 C CNN
F 3 "" H 1300 2350 50  0001 C CNN
	1    1300 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 61C2054A
P 1950 2050
F 0 "D?" H 1950 1833 50  0000 C CNN
F 1 "D" H 1950 1924 50  0000 C CNN
F 2 "" H 1950 2050 50  0001 C CNN
F 3 "~" H 1950 2050 50  0001 C CNN
	1    1950 2050
	-1   0    0    1   
$EndComp
Connection ~ 1800 2050
$Comp
L 2021-09-17_08-57-00:LD39050PUR U?
U 1 1 61C20986
P 2350 2050
F 0 "U?" H 3150 2437 60  0000 C CNN
F 1 "LD39050PUR" H 3150 2331 60  0000 C CNN
F 2 "DFN6_3X3_STM" H 3150 2290 60  0001 C CNN
F 3 "" H 2350 2050 60  0000 C CNN
	1    2350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2150 4300 2150
Wire Wire Line
	4300 1600 3400 1600
Wire Wire Line
	2100 1600 2100 2050
Wire Wire Line
	4300 1600 4300 2150
Wire Wire Line
	2350 2050 2100 2050
Connection ~ 2100 2050
Wire Wire Line
	2350 2150 2250 2150
Wire Wire Line
	2250 2150 2250 2450
$Comp
L power:GND #PWR?
U 1 1 61C21706
P 2250 2450
F 0 "#PWR?" H 2250 2200 50  0001 C CNN
F 1 "GND" H 2255 2277 50  0000 C CNN
F 2 "" H 2250 2450 50  0001 C CNN
F 3 "" H 2250 2450 50  0001 C CNN
	1    2250 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C223EC
P 3950 1900
F 0 "#PWR?" H 3950 1650 50  0001 C CNN
F 1 "GND" H 3955 1727 50  0000 C CNN
F 2 "" H 3950 1900 50  0001 C CNN
F 3 "" H 3950 1900 50  0001 C CNN
	1    3950 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 2050 3950 1900
$Comp
L Device:C C?
U 1 1 61C249CF
P 3100 1450
F 0 "C?" H 3215 1496 50  0000 L CNN
F 1 "1uF" H 3215 1405 50  0000 L CNN
F 2 "" H 3138 1300 50  0001 C CNN
F 3 "~" H 3100 1450 50  0001 C CNN
	1    3100 1450
	1    0    0    -1  
$EndComp
Connection ~ 3100 1600
Wire Wire Line
	3100 1600 2100 1600
$Comp
L Device:C C?
U 1 1 61C24E01
P 3400 1450
F 0 "C?" H 3515 1496 50  0000 L CNN
F 1 "100nF" H 3515 1405 50  0000 L CNN
F 2 "" H 3438 1300 50  0001 C CNN
F 3 "~" H 3400 1450 50  0001 C CNN
	1    3400 1450
	1    0    0    -1  
$EndComp
Connection ~ 3400 1600
Wire Wire Line
	3400 1600 3100 1600
$Comp
L power:GND #PWR?
U 1 1 61C250A5
P 3250 1200
F 0 "#PWR?" H 3250 950 50  0001 C CNN
F 1 "GND" H 3255 1027 50  0000 C CNN
F 2 "" H 3250 1200 50  0001 C CNN
F 3 "" H 3250 1200 50  0001 C CNN
	1    3250 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 1300 3250 1300
Wire Wire Line
	3250 1300 3250 1200
Wire Wire Line
	3400 1300 3250 1300
Connection ~ 3250 1300
Wire Wire Line
	3950 2350 4150 2350
Wire Wire Line
	4700 2350 4700 2300
$Comp
L power:+3.3V #PWR?
U 1 1 61C2667D
P 4700 2300
F 0 "#PWR?" H 4700 2150 50  0001 C CNN
F 1 "+3.3V" H 4715 2473 50  0000 C CNN
F 2 "" H 4700 2300 50  0001 C CNN
F 3 "" H 4700 2300 50  0001 C CNN
	1    4700 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C2805D
P 4150 2500
F 0 "C?" H 4265 2546 50  0000 L CNN
F 1 "1uF" H 4265 2455 50  0000 L CNN
F 2 "" H 4188 2350 50  0001 C CNN
F 3 "~" H 4150 2500 50  0001 C CNN
	1    4150 2500
	1    0    0    -1  
$EndComp
Connection ~ 4150 2350
Wire Wire Line
	4150 2350 4450 2350
$Comp
L Device:C C?
U 1 1 61C28143
P 4450 2500
F 0 "C?" H 4565 2546 50  0000 L CNN
F 1 "100nF" H 4565 2455 50  0000 L CNN
F 2 "" H 4488 2350 50  0001 C CNN
F 3 "~" H 4450 2500 50  0001 C CNN
	1    4450 2500
	1    0    0    -1  
$EndComp
Connection ~ 4450 2350
Wire Wire Line
	4450 2350 4700 2350
$Comp
L power:GND #PWR?
U 1 1 61C28237
P 4300 2700
F 0 "#PWR?" H 4300 2450 50  0001 C CNN
F 1 "GND" H 4305 2527 50  0000 C CNN
F 2 "" H 4300 2700 50  0001 C CNN
F 3 "" H 4300 2700 50  0001 C CNN
	1    4300 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2650 4300 2650
Wire Wire Line
	4300 2650 4300 2700
Wire Wire Line
	4450 2650 4300 2650
Connection ~ 4300 2650
$Comp
L power:+5V #PWR?
U 1 1 61C29868
P 2100 1600
F 0 "#PWR?" H 2100 1450 50  0001 C CNN
F 1 "+5V" H 2115 1773 50  0000 C CNN
F 2 "" H 2100 1600 50  0001 C CNN
F 3 "" H 2100 1600 50  0001 C CNN
	1    2100 1600
	1    0    0    -1  
$EndComp
Connection ~ 2100 1600
$Comp
L RF_LoRa_E5:LoRa-E5 U?
U 1 1 61C46E2B
P 8000 2600
F 0 "U?" H 8741 2646 50  0000 L CNN
F 1 "LoRa-E5" H 8741 2555 50  0000 L CNN
F 2 "" H 8000 2600 50  0001 C CNN
F 3 "" H 8000 2600 50  0001 C CNN
	1    8000 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C46F7A
P 6500 2350
F 0 "C?" H 6615 2396 50  0000 L CNN
F 1 "4.7uF" H 6615 2305 50  0000 L CNN
F 2 "" H 6538 2200 50  0001 C CNN
F 3 "~" H 6500 2350 50  0001 C CNN
	1    6500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2300 7300 2200
Wire Wire Line
	6500 2200 4950 2200
Wire Wire Line
	4950 2200 4950 2350
Wire Wire Line
	4950 2350 4700 2350
Connection ~ 4700 2350
Wire Wire Line
	6750 2500 6750 2400
Wire Wire Line
	4950 2500 4950 2650
Wire Wire Line
	4950 2650 4450 2650
Connection ~ 4450 2650
Wire Wire Line
	8300 1900 8300 1700
$Comp
L power:GND #PWR?
U 1 1 61C4A82D
P 8300 1700
F 0 "#PWR?" H 8300 1450 50  0001 C CNN
F 1 "GND" H 8305 1527 50  0000 C CNN
F 2 "" H 8300 1700 50  0001 C CNN
F 3 "" H 8300 1700 50  0001 C CNN
	1    8300 1700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C4A8F9
P 9650 2800
F 0 "#PWR?" H 9650 2550 50  0001 C CNN
F 1 "GND" V 9655 2672 50  0000 R CNN
F 2 "" H 9650 2800 50  0001 C CNN
F 3 "" H 9650 2800 50  0001 C CNN
	1    9650 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2500 6500 2500
Wire Wire Line
	6750 2400 7300 2400
Wire Wire Line
	8700 2700 9250 2700
$Comp
L Switch:SW_MEC_5E SW?
U 1 1 61C4C7D1
P 9450 2700
F 0 "SW?" H 9450 3085 50  0000 C CNN
F 1 "SW_MEC_5E" H 9450 2994 50  0000 C CNN
F 2 "" H 9450 3000 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=1371" H 9450 3000 50  0001 C CNN
	1    9450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2600 9250 2700
Connection ~ 9250 2700
Wire Wire Line
	9650 2600 9650 2700
Wire Wire Line
	8700 2800 9650 2800
Wire Wire Line
	9650 2700 9650 2800
Connection ~ 9650 2700
Connection ~ 9650 2800
$Comp
L Device:C C?
U 1 1 61C516A6
P 9450 2200
F 0 "C?" V 9198 2200 50  0000 C CNN
F 1 "100nF" V 9289 2200 50  0000 C CNN
F 2 "" H 9488 2050 50  0001 C CNN
F 3 "~" H 9450 2200 50  0001 C CNN
	1    9450 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 2600 9300 2600
Wire Wire Line
	9300 2600 9300 2200
Connection ~ 9250 2600
Wire Wire Line
	9600 2200 9650 2200
Wire Wire Line
	9650 2200 9650 2600
Connection ~ 9650 2600
Wire Wire Line
	7300 2500 6950 2500
Text Label 6950 2500 0    50   ~ 0
SWDIO
Wire Wire Line
	7300 2600 6950 2600
Text Label 6950 2600 0    50   ~ 0
SWDCLK
Wire Wire Line
	7700 3300 7700 3550
Text Label 7700 3550 0    50   ~ 0
SWO
Text Label 9100 2700 2    50   ~ 0
NRST
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 61C55EAB
P 6200 1100
F 0 "J?" H 6306 1478 50  0000 C CNN
F 1 "Conn_01x06_Male" H 6306 1387 50  0000 C CNN
F 2 "" H 6200 1100 50  0001 C CNN
F 3 "~" H 6200 1100 50  0001 C CNN
	1    6200 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 900  6700 900 
Wire Wire Line
	6400 1000 6700 1000
Wire Wire Line
	6400 1100 6700 1100
Wire Wire Line
	6400 1200 6700 1200
Wire Wire Line
	6400 1300 6700 1300
Wire Wire Line
	6400 1400 6700 1400
Text Label 6700 900  0    50   ~ 0
+3.3V
Text Label 6700 1000 0    50   ~ 0
SWDCLK
Text Label 6700 1100 0    50   ~ 0
GND
Text Label 6700 1200 0    50   ~ 0
SWDIO
Text Label 6700 1300 0    50   ~ 0
NRST
Text Label 6700 1400 0    50   ~ 0
SWO
$Comp
L power:GND #PWR?
U 1 1 61C5F61C
P 8300 3450
F 0 "#PWR?" H 8300 3200 50  0001 C CNN
F 1 "GND" H 8305 3277 50  0000 C CNN
F 2 "" H 8300 3450 50  0001 C CNN
F 3 "" H 8300 3450 50  0001 C CNN
	1    8300 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3300 8300 3450
Connection ~ 6500 2200
Connection ~ 6500 2500
Wire Wire Line
	6500 2200 7300 2200
Wire Wire Line
	6500 2500 6750 2500
$Comp
L Analog_ADC:ADS1232IPW U?
U 1 1 61D329A3
P 2150 6050
F 0 "U?" H 2150 7328 50  0000 C CNN
F 1 "ADS1232IPW" H 2150 7237 50  0000 C CNN
F 2 "" H 2150 6050 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/ads1232.pdf" H 2150 6050 50  0001 C CNN
	1    2150 6050
	1    0    0    -1  
$EndComp
$Comp
L Sensor:BME680 U?
U 1 1 61D32ACA
P 2150 3700
F 0 "U?" H 1720 3746 50  0000 R CNN
F 1 "BME680" H 1720 3655 50  0000 R CNN
F 2 "Package_LGA:Bosch_LGA-8_3x3mm_P0.8mm_ClockwisePinNumbering" H 3600 3250 50  0001 C CNN
F 3 "https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BME680-DS001.pdf" H 2150 3500 50  0001 C CNN
	1    2150 3700
	1    0    0    -1  
$EndComp
$Comp
L Reference_Voltage:REF5050AD U?
U 1 1 61D32C89
P 4800 1050
F 0 "U?" H 4800 1528 50  0000 C CNN
F 1 "REF5050AD" H 4800 1437 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4725 800 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/ref5030.pdf" H 4750 1050 50  0001 C CIN
	1    4800 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61D33889
P 5250 1400
F 0 "C?" H 5365 1446 50  0000 L CNN
F 1 "C" H 5365 1355 50  0000 L CNN
F 2 "" H 5288 1250 50  0001 C CNN
F 3 "~" H 5250 1400 50  0001 C CNN
	1    5250 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61D3392B
P 5650 1400
F 0 "C?" H 5765 1446 50  0000 L CNN
F 1 "C" H 5765 1355 50  0000 L CNN
F 2 "" H 5688 1250 50  0001 C CNN
F 3 "~" H 5650 1400 50  0001 C CNN
	1    5650 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1150 5250 1150
Wire Wire Line
	5250 1150 5250 1250
Wire Wire Line
	4700 1350 4700 1550
Wire Wire Line
	4700 1550 5250 1550
Wire Wire Line
	5250 1550 5650 1550
Connection ~ 5250 1550
Wire Wire Line
	5650 950  5500 950 
$Comp
L Device:C C?
U 1 1 61D3846A
P 5600 600
F 0 "C?" V 5852 600 50  0000 C CNN
F 1 "C" V 5761 600 50  0000 C CNN
F 2 "" H 5638 450 50  0001 C CNN
F 3 "~" H 5600 600 50  0001 C CNN
	1    5600 600 
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 61D385D6
P 5350 750
F 0 "R?" V 5143 750 50  0000 C CNN
F 1 "R" V 5234 750 50  0000 C CNN
F 2 "" V 5280 750 50  0001 C CNN
F 3 "~" H 5350 750 50  0001 C CNN
	1    5350 750 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 61D3ADBC
P 5750 700
F 0 "#PWR?" H 5750 450 50  0001 C CNN
F 1 "GNDA" H 5755 527 50  0000 C CNN
F 2 "" H 5750 700 50  0001 C CNN
F 3 "" H 5750 700 50  0001 C CNN
	1    5750 700 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 61D3AE2F
P 4700 1550
F 0 "#PWR?" H 4700 1300 50  0001 C CNN
F 1 "GNDA" H 4705 1377 50  0000 C CNN
F 2 "" H 4700 1550 50  0001 C CNN
F 3 "" H 4700 1550 50  0001 C CNN
	1    4700 1550
	1    0    0    -1  
$EndComp
Connection ~ 4700 1550
Wire Wire Line
	5750 700  5750 600 
Wire Wire Line
	5450 600  5350 600 
Wire Wire Line
	5350 900  5350 950 
Connection ~ 5350 950 
Wire Wire Line
	5350 950  5200 950 
$Comp
L Device:C C?
U 1 1 61D3EE88
P 4400 650
F 0 "C?" V 4148 650 50  0000 C CNN
F 1 "C" V 4239 650 50  0000 C CNN
F 2 "" H 4438 500 50  0001 C CNN
F 3 "~" H 4400 650 50  0001 C CNN
	1    4400 650 
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 750  4700 650 
Wire Wire Line
	4700 650  4550 650 
Wire Wire Line
	4250 650  4250 1550
Wire Wire Line
	4250 1550 4700 1550
Wire Wire Line
	5650 950  5650 1250
$Comp
L power:+5VA #PWR?
U 1 1 61D43B72
P 5500 950
F 0 "#PWR?" H 5500 800 50  0001 C CNN
F 1 "+5VA" H 5515 1123 50  0000 C CNN
F 2 "" H 5500 950 50  0001 C CNN
F 3 "" H 5500 950 50  0001 C CNN
	1    5500 950 
	1    0    0    -1  
$EndComp
Connection ~ 5500 950 
Wire Wire Line
	5500 950  5350 950 
Wire Wire Line
	2850 6650 2850 6750
Wire Wire Line
	2850 6850 2850 6750
Connection ~ 2850 6750
Wire Wire Line
	2150 7150 2250 7150
Wire Wire Line
	2350 7150 2250 7150
Connection ~ 2250 7150
Wire Wire Line
	2850 7150 2350 7150
Connection ~ 2850 6850
Wire Wire Line
	2850 6850 2850 7150
Connection ~ 2350 7150
$Comp
L power:GND #PWR?
U 1 1 61D4D3F1
P 2850 7150
F 0 "#PWR?" H 2850 6900 50  0001 C CNN
F 1 "GND" H 2855 6977 50  0000 C CNN
F 2 "" H 2850 7150 50  0001 C CNN
F 3 "" H 2850 7150 50  0001 C CNN
	1    2850 7150
	1    0    0    -1  
$EndComp
Connection ~ 2850 7150
$Comp
L power:GNDA #PWR?
U 1 1 61D4D46E
P 1950 7300
F 0 "#PWR?" H 1950 7050 50  0001 C CNN
F 1 "GNDA" H 1955 7127 50  0000 C CNN
F 2 "" H 1950 7300 50  0001 C CNN
F 3 "" H 1950 7300 50  0001 C CNN
	1    1950 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 7150 1950 7300
$Comp
L Device:R R?
U 1 1 61D4FB14
P 3100 5550
F 0 "R?" V 2893 5550 50  0000 C CNN
F 1 "22" V 2984 5550 50  0000 C CNN
F 2 "" V 3030 5550 50  0001 C CNN
F 3 "~" H 3100 5550 50  0001 C CNN
	1    3100 5550
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61D503CD
P 3100 5650
F 0 "R?" V 2893 5650 50  0000 C CNN
F 1 "22" V 2984 5650 50  0000 C CNN
F 2 "" V 3030 5650 50  0001 C CNN
F 3 "~" H 3100 5650 50  0001 C CNN
	1    3100 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61D5179A
P 3100 5750
F 0 "R?" V 2893 5750 50  0000 C CNN
F 1 "22" V 2984 5750 50  0000 C CNN
F 2 "" V 3030 5750 50  0001 C CNN
F 3 "~" H 3100 5750 50  0001 C CNN
	1    3100 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 4950 2850 4950
Wire Wire Line
	2850 4950 2850 5250
Wire Wire Line
	2850 5250 2850 5350
Connection ~ 2850 5250
$Comp
L Device:C C?
U 1 1 61D57B7D
P 2850 4800
F 0 "C?" H 2965 4846 50  0000 L CNN
F 1 "2.2uF" H 2965 4755 50  0000 L CNN
F 2 "" H 2888 4650 50  0001 C CNN
F 3 "~" H 2850 4800 50  0001 C CNN
	1    2850 4800
	1    0    0    -1  
$EndComp
Connection ~ 2850 4950
$Comp
L power:GND #PWR?
U 1 1 61D581C7
P 3300 4700
F 0 "#PWR?" H 3300 4450 50  0001 C CNN
F 1 "GND" H 3305 4527 50  0000 C CNN
F 2 "" H 3300 4700 50  0001 C CNN
F 3 "" H 3300 4700 50  0001 C CNN
	1    3300 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4650 3300 4650
Wire Wire Line
	3300 4650 3300 4700
$Comp
L Device:C C?
U 1 1 61D5D3A6
P 1000 5600
F 0 "C?" H 1115 5646 50  0000 L CNN
F 1 "0.1uF" H 1115 5555 50  0000 L CNN
F 2 "" H 1038 5450 50  0001 C CNN
F 3 "~" H 1000 5600 50  0001 C CNN
	1    1000 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5450 1450 5450
Wire Wire Line
	1450 5450 1450 5550
Wire Wire Line
	1450 5650 1450 5750
Wire Wire Line
	1450 5750 1000 5750
$Comp
L power:GND #PWR?
U 1 1 61D65D01
P 3000 6350
F 0 "#PWR?" H 3000 6100 50  0001 C CNN
F 1 "GND" H 3005 6177 50  0000 C CNN
F 2 "" H 3000 6350 50  0001 C CNN
F 3 "" H 3000 6350 50  0001 C CNN
	1    3000 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 6250 3000 6250
Wire Wire Line
	3000 6250 3000 6350
Wire Wire Line
	2850 5550 2950 5550
Wire Wire Line
	2850 5650 2950 5650
Wire Wire Line
	2850 5750 2950 5750
Wire Wire Line
	1450 5250 1000 5250
Wire Wire Line
	1450 6850 950  6850
Wire Wire Line
	1450 6350 1450 6400
Wire Wire Line
	1450 6400 1350 6400
Wire Wire Line
	1350 6400 1350 6450
Connection ~ 1450 6400
Wire Wire Line
	1450 6400 1450 6450
$Comp
L power:GNDA #PWR?
U 1 1 61D7F0ED
P 1350 6450
F 0 "#PWR?" H 1350 6200 50  0001 C CNN
F 1 "GNDA" H 1355 6277 50  0000 C CNN
F 2 "" H 1350 6450 50  0001 C CNN
F 3 "" H 1350 6450 50  0001 C CNN
	1    1350 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61D81506
P 1600 4700
F 0 "C?" H 1485 4654 50  0000 R CNN
F 1 "2.2uF" H 1485 4745 50  0000 R CNN
F 2 "" H 1638 4550 50  0001 C CNN
F 3 "~" H 1600 4700 50  0001 C CNN
	1    1600 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	1950 4950 1600 4950
Wire Wire Line
	1600 4950 1600 4850
Wire Wire Line
	1600 4550 1400 4550
Wire Wire Line
	1400 4550 1400 4650
$Comp
L power:GNDA #PWR?
U 1 1 61D892D6
P 1400 4650
F 0 "#PWR?" H 1400 4400 50  0001 C CNN
F 1 "GNDA" H 1405 4477 50  0000 C CNN
F 2 "" H 1400 4650 50  0001 C CNN
F 3 "" H 1400 4650 50  0001 C CNN
	1    1400 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR?
U 1 1 61D8AA5F
P 1950 4700
F 0 "#PWR?" H 1950 4550 50  0001 C CNN
F 1 "+5VA" H 1965 4873 50  0000 C CNN
F 2 "" H 1950 4700 50  0001 C CNN
F 3 "" H 1950 4700 50  0001 C CNN
	1    1950 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4700 1950 4950
Connection ~ 1950 4950
Wire Wire Line
	1450 6050 1000 6050
Wire Wire Line
	1450 6150 1000 6150
Text Label 1000 5250 0    50   ~ 0
REFP
Text Label 1000 6050 0    50   ~ 0
AINP1
Text Label 1000 6150 0    50   ~ 0
AINN1
Text Label 950  6850 0    50   ~ 0
REFN
$Comp
L Device:CP C?
U 1 1 61D97939
P 6050 4700
F 0 "C?" H 6168 4746 50  0000 L CNN
F 1 "100uF" H 6168 4655 50  0000 L CNN
F 2 "" H 6088 4550 50  0001 C CNN
F 3 "~" H 6050 4700 50  0001 C CNN
	1    6050 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61D996F6
P 4800 4300
F 0 "C?" H 4915 4346 50  0000 L CNN
F 1 "100pF" H 4915 4255 50  0000 L CNN
F 2 "" H 4838 4150 50  0001 C CNN
F 3 "~" H 4800 4300 50  0001 C CNN
	1    4800 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Feedthrough C?
U 1 1 61D997EC
P 5450 4550
F 0 "C?" H 5450 4855 50  0000 C CNN
F 1 "C_Feedthrough" H 5450 4764 50  0000 C CNN
F 2 "" V 5450 4550 50  0001 C CNN
F 3 "~" V 5450 4550 50  0001 C CNN
	1    5450 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61D9D81E
P 6600 4450
F 0 "R?" V 6393 4450 50  0000 C CNN
F 1 "100" V 6484 4450 50  0000 C CNN
F 2 "" V 6530 4450 50  0001 C CNN
F 3 "~" H 6600 4450 50  0001 C CNN
	1    6600 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 4650 5650 4650
$Comp
L Device:C_Feedthrough C?
U 1 1 61DA9B1A
P 5450 4750
F 0 "C?" H 5450 4962 50  0000 C CNN
F 1 "C_Feedthrough" H 5450 5053 50  0000 C CNN
F 2 "" V 5450 4750 50  0001 C CNN
F 3 "~" V 5450 4750 50  0001 C CNN
	1    5450 4750
	-1   0    0    1   
$EndComp
Connection ~ 5450 4650
$Comp
L Device:C C?
U 1 1 61DB1FF3
P 4800 5000
F 0 "C?" H 4915 5046 50  0000 L CNN
F 1 "100pF" H 4915 4955 50  0000 L CNN
F 2 "" H 4838 4850 50  0001 C CNN
F 3 "~" H 4800 5000 50  0001 C CNN
	1    4800 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61DB20D3
P 6600 4850
F 0 "R?" V 6393 4850 50  0000 C CNN
F 1 "100" V 6484 4850 50  0000 C CNN
F 2 "" V 6530 4850 50  0001 C CNN
F 3 "~" H 6600 4850 50  0001 C CNN
	1    6600 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 4850 6050 4850
Wire Wire Line
	6450 4850 6050 4850
Connection ~ 6050 4850
Wire Wire Line
	6050 4550 6050 4450
Wire Wire Line
	5650 4450 6050 4450
Connection ~ 6050 4450
Wire Wire Line
	6050 4450 6450 4450
Wire Wire Line
	4800 4850 4600 4850
Connection ~ 4800 4850
Wire Wire Line
	4800 4450 4600 4450
Connection ~ 4800 4450
Wire Wire Line
	4800 5150 4800 5200
Wire Wire Line
	4800 5200 5000 5200
Wire Wire Line
	5000 5200 5000 5250
$Comp
L power:GNDA #PWR?
U 1 1 61DD1175
P 5000 5250
F 0 "#PWR?" H 5000 5000 50  0001 C CNN
F 1 "GNDA" H 5005 5077 50  0000 C CNN
F 2 "" H 5000 5250 50  0001 C CNN
F 3 "" H 5000 5250 50  0001 C CNN
	1    5000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3900 5000 3900
Wire Wire Line
	5000 3900 5000 3950
Wire Wire Line
	4800 3900 4800 4150
$Comp
L power:GNDA #PWR?
U 1 1 61DE4DC2
P 5000 3950
F 0 "#PWR?" H 5000 3700 50  0001 C CNN
F 1 "GNDA" H 5005 3777 50  0000 C CNN
F 2 "" H 5000 3950 50  0001 C CNN
F 3 "" H 5000 3950 50  0001 C CNN
	1    5000 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 61DE4E5F
P 5650 4650
F 0 "#PWR?" H 5650 4400 50  0001 C CNN
F 1 "GNDA" V 5655 4522 50  0000 R CNN
F 2 "" H 5650 4650 50  0001 C CNN
F 3 "" H 5650 4650 50  0001 C CNN
	1    5650 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 4450 5250 4450
Wire Wire Line
	4800 4850 5250 4850
Wire Wire Line
	6750 4450 6950 4450
Wire Wire Line
	6750 4850 6950 4850
Text Label 6950 4450 0    50   ~ 0
ref+
Text Label 6950 4850 0    50   ~ 0
ref-
$Comp
L Device:CP C?
U 1 1 61E04A74
P 5850 6350
F 0 "C?" H 5968 6396 50  0000 L CNN
F 1 "0.1uF" H 5968 6305 50  0000 L CNN
F 2 "" H 5888 6200 50  0001 C CNN
F 3 "~" H 5850 6350 50  0001 C CNN
	1    5850 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61E04A7B
P 4600 5950
F 0 "C?" H 4715 5996 50  0000 L CNN
F 1 "100pF" H 4715 5905 50  0000 L CNN
F 2 "" H 4638 5800 50  0001 C CNN
F 3 "~" H 4600 5950 50  0001 C CNN
	1    4600 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Feedthrough C?
U 1 1 61E04A82
P 5250 6200
F 0 "C?" H 5250 6505 50  0000 C CNN
F 1 "C_Feedthrough" H 5250 6414 50  0000 C CNN
F 2 "" V 5250 6200 50  0001 C CNN
F 3 "~" V 5250 6200 50  0001 C CNN
	1    5250 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61E04A89
P 6400 6100
F 0 "R?" V 6193 6100 50  0000 C CNN
F 1 "0" V 6284 6100 50  0000 C CNN
F 2 "" V 6330 6100 50  0001 C CNN
F 3 "~" H 6400 6100 50  0001 C CNN
	1    6400 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 6300 5450 6300
$Comp
L Device:C_Feedthrough C?
U 1 1 61E04A91
P 5250 6400
F 0 "C?" H 5250 6612 50  0000 C CNN
F 1 "C_Feedthrough" H 5250 6703 50  0000 C CNN
F 2 "" V 5250 6400 50  0001 C CNN
F 3 "~" V 5250 6400 50  0001 C CNN
	1    5250 6400
	-1   0    0    1   
$EndComp
Connection ~ 5250 6300
$Comp
L Device:C C?
U 1 1 61E04A99
P 4600 6650
F 0 "C?" H 4715 6696 50  0000 L CNN
F 1 "100pF" H 4715 6605 50  0000 L CNN
F 2 "" H 4638 6500 50  0001 C CNN
F 3 "~" H 4600 6650 50  0001 C CNN
	1    4600 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61E04AA0
P 6400 6500
F 0 "R?" V 6193 6500 50  0000 C CNN
F 1 "0" V 6284 6500 50  0000 C CNN
F 2 "" V 6330 6500 50  0001 C CNN
F 3 "~" H 6400 6500 50  0001 C CNN
	1    6400 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 6500 5850 6500
Wire Wire Line
	6250 6500 5850 6500
Connection ~ 5850 6500
Wire Wire Line
	5850 6200 5850 6100
Wire Wire Line
	5450 6100 5850 6100
Connection ~ 5850 6100
Wire Wire Line
	5850 6100 6250 6100
Wire Wire Line
	4600 6500 4400 6500
Connection ~ 4600 6500
Wire Wire Line
	4600 6100 4400 6100
Connection ~ 4600 6100
Wire Wire Line
	4600 6800 4600 6850
Wire Wire Line
	4600 6850 4800 6850
Wire Wire Line
	4800 6850 4800 6900
$Comp
L power:GNDA #PWR?
U 1 1 61E04AB5
P 4800 6900
F 0 "#PWR?" H 4800 6650 50  0001 C CNN
F 1 "GNDA" H 4805 6727 50  0000 C CNN
F 2 "" H 4800 6900 50  0001 C CNN
F 3 "" H 4800 6900 50  0001 C CNN
	1    4800 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5550 4800 5550
Wire Wire Line
	4800 5550 4800 5600
Wire Wire Line
	4600 5550 4600 5800
$Comp
L power:GNDA #PWR?
U 1 1 61E04ABE
P 4800 5600
F 0 "#PWR?" H 4800 5350 50  0001 C CNN
F 1 "GNDA" H 4805 5427 50  0000 C CNN
F 2 "" H 4800 5600 50  0001 C CNN
F 3 "" H 4800 5600 50  0001 C CNN
	1    4800 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 61E04AC4
P 5450 6300
F 0 "#PWR?" H 5450 6050 50  0001 C CNN
F 1 "GNDA" V 5455 6172 50  0000 R CNN
F 2 "" H 5450 6300 50  0001 C CNN
F 3 "" H 5450 6300 50  0001 C CNN
	1    5450 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 6100 5050 6100
Wire Wire Line
	4600 6500 5050 6500
Wire Wire Line
	6550 6100 6750 6100
Wire Wire Line
	6550 6500 6750 6500
Text Label 4600 4450 0    50   ~ 0
REFP
Text Label 4600 4850 0    50   ~ 0
REFN
Text Label 4400 6100 0    50   ~ 0
AINP1
Text Label 4400 6500 0    50   ~ 0
AINN1
Text Label 6750 6100 0    50   ~ 0
AIN+
Text Label 6750 6500 0    50   ~ 0
AIN-
$EndSCHEMATC