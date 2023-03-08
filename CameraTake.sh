#! /usr/bin/env bash
#! /bin/sh
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
# Date Created: 01/03/2023
# Date of Version Completion:
#
# Description:
# This script is designed to take a picture when the script is run. It should save the image in the current directory, which should be 'camera', with the nameing convention 
# for each image being the ISO standard 8601 for date and time.
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# -------------Date command into variable for image name

DATEFORMATV=$(date +"%Y-%m-%d T%H:%M:%S%z")
echo -e "The date is  ${DATEFORMATV}\n"     #To test that the variable is working, will need to remove this line.

# -------------Set camera settings



