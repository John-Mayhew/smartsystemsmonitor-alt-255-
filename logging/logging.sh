#! /usr/bin/env bash
#
logfile=/home/pi/github/smartsystemsmonitor-alt-255/logging/log.txt #sets the location of the log file that will be used to store all logs

LOGGING()
{
	now=$(printf "%([%FT%H:%M:%S])T" | awk -F [-T:] '{print$1$2$3$4$5$6}')
	echo -e "${now} $1\n" >> ${logfile}
}
