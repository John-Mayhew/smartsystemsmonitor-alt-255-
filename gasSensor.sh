#! /usr/bin/env bash
#! /bin/sh
#! /bin/bash -e
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
import time
from grove.grove_gas_sensor_mq5 import GroveGasSensorMQ5
from datetime import datetime

# connect sensor to analog port
PIN = "0"
sensor = GroveGasSensorMQ5(PIN)

while True:
    try:
        
        # get and print the reading 
        timestamp = datetime.utcnow().isoformat()
        gas_reading = sensor.MQ5 #? .MQ5 .value
        print(f'{timestamp}: Gas value: {gas_reading}')
        
        # sleep before getting a new reading
        time.sleep(1)

    # if ctrl+c is pressed; stop
    except KeyboardInterrupt
        break

# print(dir(sensor))
