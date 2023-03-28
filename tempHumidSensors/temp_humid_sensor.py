#! /usr/bin/env python
#
# Author: Group Alt 255
#
# Contributors:
#
# John Mayhew           |       <jm1460@canterbury.ac.uk>
# Cameron Browne        |       <cb1258@canterbury.ac.uk>
# Cj Wilson             |       <c.wilson831@canterbury.ac.uk>
# Oliver Rush-Gadsby     |       <or56@canterbury.ac.uk>
#
# Version 1.0
# Date Created: 28/03/2023
# Date of Version Completion:
#
# Description:
# This script was created to read temperature and humidity readings from the sensor.
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- Declaring Variables

import Adafruit_DHT

DHT_SENSOR = Adafruit_DHT.DHT22
DHT_PIN = 4

while True:
  humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)
  
  if = humidity is not Noe and temperature is not None:
    print("Temp={0:0.1f}*C Humidity={1:0.1}%".format(temperature, humidity))
    else:
    print("Failed to retrieve data from humidity sensor")
    
   
