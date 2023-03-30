#! /bin/bash
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
# Date Created: 28/03/2023
# Date of Version Completion:28/03/2023
#
# Description:
# This script is for the log rotation; it is used to remove every line after the 100th line to keep the log file clean and up to date.
#
#

logPath=/home/pi/github/smartsystemsmonitor-alt-255/logging/log.txt
currentSize=$(wc -c < "${logPath}")
maxSize=2097152 # 2MB

	if [ "${currentSize}" -gt "${maxSize}" ]; then

		mv ${logPath}.1.gz ${logPath}.2.gz || continue

		ogger "ace:rotatelogs" "rotating log shifting by 1"

		gzip -c ${logPath}.txt > ${logPath}.1.gz

	fi
