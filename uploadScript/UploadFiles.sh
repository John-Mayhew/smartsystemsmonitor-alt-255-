#! usr/bin/env bash
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
# Date of Version Completion:30/03/2023
#
# Description:
# This script was created to upload files onto the CCCU cloud storage network. There are two different locations as to where our data needs to be uploaded,
# one for our pictures and another for the sensor data. 
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------

Pictures=$(ls -l /home/pi/github/smartsystemsmonitor-alt-255/camera/pictures/*.jpg) all files with a .jpg extension are included
Sensors=$(/home/pi/github/smartsystemsmonitor-alt-255/logging/*.csv) # all files with a .csv extension are included


sshpass -p 'guest' rsync -rv ${Pictures} guest@10.150.200.112:/mnt/NAS/Data/2023/Alt255/Pictures

sshpass -p 'guest' rsync -rv ${Sensors} guest@10.150.200.112:/mnt/NAS/Data/2023/Alt255/Sensors

