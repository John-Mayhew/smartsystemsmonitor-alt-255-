#! /usr/bin/env bash
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
# Date Created: 30/03/2023
# Date of Version Completion: 30/03/2023
#
# Description:
# This script was created to take temperature and humidity readings from the sensor.
# This script works alongside the readings.csv, that holds the gathered temperature and humidity values. 
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------import os
import time
import os
import sys
from datetime import datetime
import csv
import seeed_dht

directory = "/home/pi/github/smartsystemsmonitor-alt-255/logging"
filename = "readings.csv"
file_path = os.path.join(directory, filename)

def main():
	# for DHT22 sensor
	sensor = seeed_dht.DHT("22", 12)

	with open(file_path, 'w', newline='') as file:
		writer = csv.writer(file)
		writer.writerow(["Timestamp", "Temperature", "Humidity"])
	# this allows for it to open and write the readings to the file readings.csv
		for i in range(10):
			humi, temp = sensor.read()
			if not humi is None: # if there are readings that can be found, print these with a timestamp.
				timestamp = datetime.utcnow().isoformat()
				print('humidity {1:.1f}%, temperature {2:.1f}*'.format(sensor.dht_type, humi, temp))
				writer.writerow([timestamp, humi, temp])
			else:
				print('DHT{0}, humidity & temperature: {1}'.format(sensor.dht_type, temp))
		time.sleep(1)

if __name__ == '__main__':
	main()
