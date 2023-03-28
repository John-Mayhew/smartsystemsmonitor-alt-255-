#! /usr/bin/env python
#
# Author: Group Alt 255
#
# Contributors:
#
# John Mayhew           |       <jm1460@canterbury.ac.uk>
# Cameron Browne        |       <cb1258@canterbury.ac.uk>
# Cj Wilson             |       <c.wilson831@canterbury.ac.uk>
# Oliver Rush-Gadsby    |       <or56@canterbury.ac.uk>
#
# Version 1.0
# Date Created: 09/03/2023
# Date of Version Completion:
#
# Description:
# This script gets data from the MQ-5 gas sensor connected to the Raspberry Pi where this data will eventually be sent to external storage.
#
#----------------------------------------------------------------------------------------------------

import csv
import os
import time
from datetime import datetime

#import grovepi
#from grove.adc import ADC
#from envbash import load_envbash
sys.path.insert(0, r'/home/pi/grove.py/grove')
from grove_gas_sensor_mq5 import GroveGasSensorMQ5

# connect sensor to analog port
PIN = "0"
sensor = GroveGasSensorMQ5(PIN)

# logging (?)
#load_envbash('/home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh')
#os.environ['LOGGING "- Creating new gas readings"']

directory = 'home/pi/github/smartsystemsmonitor-alt-255/logging'
filename = "gas_sensor_data.csv"

file_path = os.path.join(directory, filename)

# open file to store data
with open(file_path, 'w', newline='') as file:
    writer = csv.writer(file)
    # add headings to file
    writer.writerow(["Timestamp", "Gas Sensor Data (ppm)"])
    
    while True:
          try:
            # get and print the reading 
            timestamp = datetime.utcnow().isoformat()
            gas_reading = sensor.MQ5

            print('{0} - Gas value: {1}'.format(timestamp, gas_reading))
        
            # write data to file
            writer.writerow([timestamp, gas_reading])
        
            # sleep before getting a new reading
            time.sleep(1)
            # if ctrl+c is pressed; stop
          except KeyboardInterrupt:
            break

# print(dir(sensor))
