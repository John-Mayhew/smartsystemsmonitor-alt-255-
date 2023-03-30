#! /usr/bin/env python3
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

import os
import csv
import sys
import time
from datetime import datetime

# import grove.py libraries
sys.path.insert(0, '/home/pi/grove.py/grove')
from grove_gas_sensor_mq5 import GroveGasSensorMQ5

# get the path of the file to write data to
directory = '/home/pi/github/smartsystemsmonitor-alt-255/logging'
filename = "gas_sensor_data.csv"
file_path = os.path.join(directory, filename)

def main():
    sensor = GroveGasSensorMQ5(0) # connect sensor to analog port A0
    
    with open(file_path, 'w', newline='') as file: # open file
        writer = csv.writer(file)
        writer.writerow(["Timestamp", "Gas Value"]) # write headings to file

        while True:
            try:
            # get the time stamp and gas reading 
             timestamp = datetime.utcnow().isoformat()
             gas_reading = sensor.MQ5
        
             print('{0} - Gas value: {1}'.format(timestamp, gas_reading)) # print the values
            
             writer.writerow([timestamp, gas_reading]) # write timestamp and gas values to file
             time.sleep(1) # sleep before getting a new reading
            
            except KeyboardInterrupt:  # if ctrl+c is pressed; stop
                break

main()
