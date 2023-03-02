#! /usr/bin/env bash
#! /bin/sh

# Author: Group Alt 255 | <jm1460@canterbury.ac.uk><cb1258@canterbury.ac.uk><CJ><or56@canterbury.ac.uk>
# Version 1.0

# Description:
# This script was created to work in relation with Chrontab to automatically update from a remote Github repository every hour if changes are found.

source /home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh

cd /home/pi/github/smartsystemsmonitor-alt-255

repository=$(pwd)


LOGGING "- Current Directory is: ${repository}"
#LOGGING "- Repository Update Script was run"

#if 
