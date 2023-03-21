#! /usr/bin/env bash

#
# Author: Group Alt 255
#
# Contributors:
#
# John Mayhew           |       <jm1460@canterbury.ac.uk>
# Cameron Browne        |       <cb1258@canterbury.ac.uk>
# Cj Wilson             |       <cw831@canterbury.ac.uk>
# Oliver Rushgadsby     |       <or56@canterbury.ac.uk>
#
# Version 1.0
# Date Created: 01/03/2023
# Date of Version Completion:
#
# Description:
# This script was created to work in relation with Chrontab to automatically update from a remote Github repository every hour if changes are found.
# The script will also be used to feed all logging information produced by this program into a log.txt file using the ISO 8601 standard for Date and Time, and logging format.
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- Declaring Variables

source /home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh # Sources the logging functin script.

cd /home/pi/github/smartsystemsmonitor-alt-255 # Sets the directory that the script will run from, allows for access to git commands because they require visability of the .git files.

repository=$(pwd) # Prints the working directory and parses this value into $Repository.
status=$(git fetch -va 2>&1 | grep -w main | grep -w "[up to date]") # Defines the variable $status and parses the result of the git fetch to whether main is up to date or requires as update.

LOGGING "- Current Directory is: ${repository}" # Prints the current working directory in the log.txt file.

if [[ ${status} ]]; then # If Git fetch returns anything other then "up-to-date" then the git fetch, the git pull will be run.

	LOGGING "- Repository requires an update, updating now" # Logging to say that the local repository does not match the remote repository and therefore requires an update. 
	gitPull=$(git pull -va 2>&1) # Parses the result of git pull to a variable so that this can be used later for logging.
	LOGGING "${gitPull} | grep -w main" # Logging the git pull so that we can monitor failures.
	LOGGING "- Status of git Pull: $?" # Logs the exit code of git pull for monitoring purposes, used to initiate a re-run if failure occurs.
	
	while [ $? != 0 ]; # While exit code is not 0 (successful) this will re-run the git pull incase of failure.
	do
		
		git pull # Pulls from the remote repository
		LOGGING "- Git pull failed (exit code 1), running git pull again" # Logging the failure every time the loop is run - Should run until completed. 
		z
		if [ $? == 0 ]; then # If exit code = 0 (successful) then the git pull has completed without failure.
		
			LOGGING "- Git Pull successful, Exit code 0, process sleeping until next scheduled event" # Logging that the git pull was successful. 
		
		fi
		
	done

else

	LOGGING "- Repository up to date" # Logging that the repository has not changed and therefore does not require an update. 
	
fi
