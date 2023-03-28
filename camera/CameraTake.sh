#! /usr/bin/env bash
#
# Author: Group alt 255
#
# Contributors:
#
# John Mayhew           |       <jm1460@canterbury.ac.uk>
# Cameron Browne        |       <cb1258@canterbury.ac.uk>
# Cj Wilson             |       <c.wilson831@canterbury.ac.uk>
# Oliver Rushgadsby     |       <or56@canterbury.ac.uk>
#
# Version 1.0
# Date Created: 09/03/2023
# Date of Version Completion: 16/03/2023
#
# Description:
# This script is designed to take a picture when the script is run. It should save the image in the current directory, which should be 'camera', with the nameing convention 
# for each image being the ISO standard 8601 for date and time.
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------ Functions Logging
source /home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh # Pulls the funciton script for logging

# -------------Date command into variable for image name

DATEFORMATV=$(date +"%Y%m%d%H%M%S")

#echo -e "The date is  ${DATEFORMATV}\n"     #To test that the variable is working, will need to remove this line.

# -------------Camera


cd /home/pi/github/smartsystemsmonitor-alt-255/camera/pictures #Move to picture directory

libcamera-jpeg -n -o ${DATEFORMATV}.jpg

cd /home/pi/github/smartsystemsmonitor-alt-255 #Move back to github repository

LOGGING "- Image taken, Saved to the Camera Directory" # Prints the current actions to the log.txt file. Camera directory: home/pi/github/smartsystemsmonitor-alt-255/camera/pictures

