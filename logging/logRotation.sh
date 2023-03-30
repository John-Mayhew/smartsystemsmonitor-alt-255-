#! /usr/bin/env bash
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

#LOG_ROTATION()
#{

	LFLC=$(wc -l ${logPath}) # LFLC - Log File Line Counter | Counts the lines in the log.txt file and cycles the oldest log.
	echo ${LFLC}
	echo \n
	echo ${logPath}

	if [[ ${LFLC} -gt 200 ]]; then
		TIMESTAMP=$(printf "%([%FT%H:%M:%S])T" | awk -F [-T:] '{print$1$2$3$4$5$6}')
		gzip -c ${logPath} > log+=${TIMESTAMP}

	fi
#}
