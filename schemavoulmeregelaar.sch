EESchema Schematic File Version 4
EELAYER 30 0
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
L Bikkel2:Arduino_Leonardo A?
U 1 1 5F9684FD
P 6575 3050
F 0 "A?" H 6575 4231 50  0001 C CNN
F 1 "Leonardo Pro Mini" H 6075 1975 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 6575 3050 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/ArduinoBoardLeonardo" H 6575 3050 50  0001 C CNN
	1    6575 3050
	1    0    0    -1  
$EndComp
$Comp
L Bikkel3:NeoPixel_THT D?
U 1 1 5F9697D7
P 4750 3350
F 0 "D?" H 4406 3396 50  0001 R CNN
F 1 "LED ring" H 5100 3675 50  0000 R CNN
F 2 "" H 4800 3050 50  0001 L TNN
F 3 "https://www.adafruit.com/product/1938" H 4850 2975 50  0001 L TNN
	1    4750 3350
	-1   0    0    -1  
$EndComp
$Comp
L Bikkel3:Push_Button SW?
U 1 1 5F969EC5
P 5525 3650
F 0 "SW?" H 5525 3942 50  0001 C CNN
F 1 "Pauze" H 5500 3575 50  0000 C CNN
F 2 "" H 5525 3850 50  0001 C CNN
F 3 "~" H 5525 3850 50  0001 C CNN
	1    5525 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6775 1800 6775 2050
Wire Wire Line
	5800 3250 6075 3250
Wire Wire Line
	5800 3150 6075 3150
Wire Wire Line
	5525 3450 6075 3450
Wire Wire Line
	6075 3350 5725 3350
Wire Wire Line
	5725 3350 5725 3400
Wire Wire Line
	5725 3400 5275 3400
Wire Wire Line
	5275 3400 5275 3350
Wire Wire Line
	5275 3350 5050 3350
Wire Wire Line
	4750 3050 4750 1800
Wire Wire Line
	4750 1800 5375 1800
Wire Wire Line
	6475 4150 6475 4250
Wire Wire Line
	6475 4250 5525 4250
Wire Wire Line
	5525 4250 5525 3850
Wire Wire Line
	4750 4250 4750 3650
Connection ~ 5525 4250
$Comp
L Device:Rotary_Encoder SW?
U 1 1 5F97049F
P 5500 3150
F 0 "SW?" H 5443 3517 50  0001 C CNN
F 1 "Rot. enc." H 5443 3425 50  0000 C CNN
F 2 "" H 5350 3310 50  0001 C CNN
F 3 "~" H 5500 3410 50  0001 C CNN
	1    5500 3150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4750 4250 5100 4250
Wire Wire Line
	6075 3050 5900 3050
Wire Wire Line
	5900 3050 5900 2700
Wire Wire Line
	5900 2700 5700 2700
Wire Wire Line
	5100 2700 5100 4250
Connection ~ 5100 4250
$Comp
L Bikkel3:Schakelaar SW?
U 1 1 5F96A2B7
P 5500 2700
F 0 "SW?" H 5500 2947 50  0001 C CNN
F 1 "Aan/uit" H 5625 2825 50  0000 C CNN
F 2 "" H 5500 2700 50  0001 C CNN
F 3 "~" H 5500 2700 50  0001 C CNN
	1    5500 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2700 5100 2700
Wire Wire Line
	5375 2950 5375 1800
Connection ~ 5375 1800
Wire Wire Line
	5375 1800 6775 1800
Wire Wire Line
	5375 3350 5375 4250
Wire Wire Line
	5100 4250 5375 4250
Connection ~ 5375 4250
Wire Wire Line
	5375 4250 5525 4250
$EndSCHEMATC
