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
# Date of Version Completion: /03/2023
#
# Description:
# This script was created to print temperature and humidity readings from the sensor.
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- Declaring Variables

import seeed_dht
import time

def main():
# DHT_SENSOR = Adafruit_DHT.DHT22
DHT_SENSOR = seeed_dht.DHT22
DHT_PIN = 12 # the slot is PWD so the pin is 12

while True:
  humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)
# humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)
  if = humidity is not None and temperature is not None:
    print("Temp={0:0.1f}*C Humidity={1:0.1}%".format(temperature, humidity))
    else:
    print("Failed to retrieve data from humidity sensor")
    # prints the temperature and humidity if there are readable values, though if there is nothing print this
main()
   
