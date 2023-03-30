#! /usr/bin/env bash
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
# Date Created: 01/03/2023
# Date of Version Completion: 28/03/2023
#
# Description:
# This script was created to work in relation with Chrontab to automatically update from a remote Github repository every hour if changes are found.
# The script will also be used to feed all logging information produced by this program into a log.txt file using the ISO 8601 standard for Date and Time, and logging format.
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- Declaring Variables
#! /usr/bin/env bash
#

logfile=/home/pi/github/smartsystemsmonitor-alt-255/logging/log.txt #sets the location of the log file that will be used to store all logs

LOGGING()
{
	now=$(printf "%([%FT%H:%M:%S])T" | awk -F [-T:] '{print$1$2$3$4$5$6}')
	echo -e "${now} $1" >> ${logfile}
}

#LOG_ROTATION
