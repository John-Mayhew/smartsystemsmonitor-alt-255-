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
# This script is gets data from the MQ-5 gas sensor connected to the Raspberry Pi where this data will eventually be sent to external storage.
#
#----------------------------------------------------------------------------------------------------

import time
from grove.grove_gas_sensor_mq5 import GroveGasSensorMQ5

# connect sensor to analog port
PIN = "0"
sensor = GroveGasSensorMQ5(PIN)

print('Detecting...')
while True:
    try:
        gas_reading = sensor.read() #? .MQ5 .value
        print(f'Gas value: {gas_reading}')
        
        # sleep before getting a new reading
        time.sleep(0.3)

    # if ctrl+c is pressed; stop
    except KeyboardInterrupt
        break

# print(dir(sensor))
