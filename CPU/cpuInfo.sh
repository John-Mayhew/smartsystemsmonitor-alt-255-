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
#! /usr/bin/env bash
#
GOVDIR="/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"
AVAILGOVS=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
CORES=$(lscpu | grep -w "CPU(s):*" | awk 'NR==1 {print$2}')

while [[ 1 ]]; do
        echo "Please select from the following governors:"
        echo  "${AVAILGOVS}"

        read GOV
        # use grep to match input with sub string of AVAILGOVS
        if grep -q "$GOV" <<< "${AVAILGOVS}"; then
                break
        fi
done

echo -n "Changing the scaling_governor all ${CORES} to "

echo "${GOV}" | sudo tee ${GOVDIR}
echo "Success your new Scaling Governor is ${GOV}"
