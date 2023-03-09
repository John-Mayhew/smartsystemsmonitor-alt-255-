#! /usr/bin/env bash
#! /bin/sh
#! /bin/bash -e
#
# Author: Group Alt 255
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
# This script was created to work in relation with Chrontab to automatically update from a remote Github repository every hour if changes are found.
# The script will also be used to feed all logging information produced by this program into a log.txt file using the ISO 8601 standard for Date and Time, and logging format.
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- Declaring Variables

source /home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh # Pulls the funciton script for logging

cd /home/pi/github/smartsystemsmonitor-alt-255 # Sets the directory that the script will run from, allows for access to git commands becuase they need visability of the .git files

repository=$(pwd) # Prints the working directory and parses this value into $Repository.

LOGGING "- Current Directory is: ${repository}" # Prints the current working directory in the log.txt file.

# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- File Exists?

if [ -f /home/pi/github/smartsystemsmonitor-alt-255/repoUpdate/fetchResult.txt ]; then # Checks if the fetchResult.txt file exists

# --------------------------------------- fetchResult.txt is empty?

        if [ ! -s /home/pi/github/smartsystemsmonitor-alt-255/repoUpdate/fetchResult.txt ]; then # Checks if the file fetchResult.txt is empty, # If True run the loop

                #Fetch result is empty
                LOGGING "- fetchResult.txt was empty - Running Fetch now." # Prints the current actions to the log.txt file.
                script -f -q /home/pi/github/smartsystemsmonitor-alt-255/repoUpdate/fetchResult.txt -c 'git fetch'


# --------------------------------------- Updated Repository?

        else

                LOGGING "- Repository is up to Date" # Logging for the repository being up to date with the remote repository

        fi

# --------------------------------------- fetchResult.txt does not exist.

else
        LOGGING "fetchResult.txt does not exist." # Error that is logged if fetchResult.txt does not exist
fi
