#! /usr/bin/env bash
#! /bin/sh
#! /bin/bash -e 

# Author: Group Alt 255 | <jm1460@canterbury.ac.uk><cb1258@canterbury.ac.uk><CJ><or56@canterbury.ac.uk>
# Version 1.0

# Description:
# This script was created to work in relation with Chrontab to automatically update from a remote Github repository every hour if changes are found.

source /home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh

cd /home/pi/github/smartsystemsmonitor-alt-255

repository=$(pwd)

LOGGING "- Current Directory is: ${repository}"

if [ -f /home/pi/github/smartsystemsmonitor-alt-255/repoUpdate/fetchResult.txt ]; then
	if [ ! -s /home/pi/github/smartsystemsmonitor-alt-255/repoUpdate/fetchResult.txt ]; then
		#Fetch result is empty
		LOGGING "- fetchResult.txt was empty - Running Fetch now."
		echo -e "this file now contains more information" >> /home/pi/github/smartsystemsmonitor-alt-255/repoUpdate/fetchResult.txt
		git fetch >> /home/pi/github/smartsystemsmonitor-alt-255/repoUpdate/fetchResult.txt
	else
		LOGGING "


Other condition met, Will not run a fetch"
	fi
else
	LOGGING "fetchResult.txt does not exist."
fi
