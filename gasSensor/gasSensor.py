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

import sys
import time
from datetime import datetime

sys.path.insert(0, '/home/pi/grove.py/grove')
from grove_gas_sensor_mq5 import GroveGasSensorMQ5

sensor = GroveGasSensorMQ5(0) # connect sensor to analog port A0

while True:
      try:
        # get the time stamp and reading 
        timestamp = datetime.utcnow().isoformat()
        gas_reading = sensor.MQ5
        
        print('{0} - Gas value: {1}'.format(timestamp, gas_reading)) # print the values
        
        time.sleep(1) # sleep before getting a new reading
        
      except KeyboardInterrupt:  # if ctrl+c is pressed; stop
        break
# print(dir(sensor))
