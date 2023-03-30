##! /usr/bin/env bash

#
# Author: Group Alt 255
#
# Contributors:
#
# John Mayhew           |       <jm1460@canterbury.ac.uk>
# Cameron Browne        |       <cb1258@canterbury.ac.uk>
# Cj Wilson             |       <cw831@canterbury.ac.uk>
# Oliver Rush-Gadsby    |       <or56@canterbury.ac.uk>
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
status=$(git fetch -va 2>&1 | grep -w 'main' | grep -w "[up to date]") # Defines the variable $status and parses the result of the git fetch to whether main is up to date or requires as update.
fetchCount=0 # Break condition for while loop to prevent indefinite retries of git fetch
pullCount=0 # Break conditon for the while loop performing the git pull incase of failure to prevent indefinite retries. 

while [[ -z ${status} && ${fetchCount} -lt 10 ]]; do

	#LOGGING "- Status is empty, Git fetch may have failed - Retrying now" # Logging for if the status variable is empty
	status=$(git fetch -va 2>&1 | grep -w main | grep -w "[up to date]") # Defines the variable $status and parses the result of the git fetch to whether main is up to date or requires as update.
	sleep 20
	let fetchCount++ # Increases the variable by 1 so that the while loop will break after 10 tries if ${status} is not filled before.

done

if  [[ -z $( echo ${status} | grep -w -o "[up to date]" ) ]]; then # If Git fetch returns anything other then "up-to-date" then the git fetch, the git pull will be run.

	LOGGING "- Repository requires an update, updating now" # Logging to say that the local repository does not match the remote repository and therefore requires an update. 
	git pull --progress
#	gitPull=$(git pull -va 2>&1 | grep -w "main") # Parses the result of git pull to a variable so that this can be used later for logging.
#	LOGGING "-${gitPull}" # Logging the git pull so that we can monitor failures.
	LOGGING "- Status of git Pull: $?" # Logs the exit code of git pull for monitoring purposes, used to initiate a re-run if failure occurs.
	pullStatus=$?

	while [[ ${pullStatus} != 0 && ${pullCount} -lt 10 ]]; # While exit code is not 0 (successful) this will re-run the git pull incase of failure.
	do

		git pull --progress # Pulls from the remote repository
		pullStatus=$?
		LOGGING "- Git pull failed (exit code 1), running git pull again" # Logging the failure every time the loop is run - Should run until completed. 
		sleep 60
		let pullCount++ # Increases the variable by 1 so that the while loop will break after 10 tries if not successful and the error code is still reporting as 1 (Failure)
		
		if [[ ${pullStatus} == 0 ]]; then # If exit code = 0 (successful) then the git pull has completed without failure.

			LOGGING "- Git Pull successful, Exit code 0, process sleeping until next scheduled event" # Logging that the git pull was successful. 
			echo $?

		fi

	done

elif [[ ${status} ]]; then

	LOGGING "- Repository up to date" # Logging that the repository has not changed and therefore does not require an update. 
	LOGGING "- ${status}"

else

	LOGGING "- Else condition was met - $({status})"

fi
