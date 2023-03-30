#!/usr/bin/env python3
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
# Date of Version Completion: 30/03/23
#
# Description:
# This script gets data from the MQ-5 gas sensor connected to the Raspberry Pi and stores it into a file, where this data will eventually be sent to external storage.
#
#----------------------------------------------------------------------------------------------------

import os
import csv
import sys
import time
from datetime import datetime
from envbash import load_envbash

# import grove.py libraries
sys.path.insert(0, '/home/pi/grove.py/grove')
from grove_gas_sensor_mq5 import GroveGasSensorMQ5

# get the path of the file to write data to
directory = '/home/pi/github/smartsystemsmonitor-alt-255/logging'
filename = "gas_sensor_data.csv"
file_path = os.path.join(directory, filename)

def main():
    sensor = GroveGasSensorMQ5(0) # connect sensor to analog port A0
<<<<<<< HEAD

=======
    
    # use the logging script to make a log that this script ran 
    #load_envbash('/home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh')
    #os.environ['LOGGING "- Creating new gas readings"']
    
>>>>>>> 1236eaacbf970f6f7710049e86046254d80b49df
    with open(file_path, 'w', newline='') as file: # open file
        writer = csv.writer(file)
        writer.writerow(["Timestamp", "Gas Value"]) # write headings to file

<<<<<<< HEAD
        for i in range(10):

            # get the time stamp and gas reading
=======
        for i in range(10): 
            # get the time stamp and gas reading 
>>>>>>> 1236eaacbf970f6f7710049e86046254d80b49df
             timestamp = datetime.utcnow().isoformat()
             gas_reading = sensor.MQ5

             print('{0} - Gas value: {1}'.format(timestamp, gas_reading)) # print the values

             writer.writerow([timestamp, gas_reading]) # write timestamp and gas values to file
             time.sleep(1) # sleep before getting a new reading
<<<<<<< HEAD

=======
           
>>>>>>> 1236eaacbf970f6f7710049e86046254d80b49df
main()
