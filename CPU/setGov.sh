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
# Oliver Rush-Gadsby     |       <or56@canterbury.ac.uk>
#
# Version 1.0
# Date Created: 23/03/2023
# Date of Version Completion:
#
# Description:
# This script is created to manually change the current governor to another. 
# This script is used to work along side setSpeed.sh and cpuInfo.sh, which are used to show information about what governor is being used and 
# the CPU speeds.
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- Declaring Variables
GOVDIR="/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"
AVAILGOVS=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
CORES=$(lscpu | grep -w "CPU(s):*" | awk 'NR==1 {print$2}')

while [[ 1 ]]; do
        echo "Please select from the following governors:"
        echo  "${AVAILGOVS}"

        read GOV
        # reading user input so it knows the desired governor.
        if grep -q "$GOV" <<< "${AVAILGOVS}"; then
                break
        fi
done
# this shows that the governor has been changed and what is has been changed to.
echo -n "Changing the scaling_governor all ${CORES} to "

echo "${GOV}" | sudo tee ${GOVDIR}
echo "Your new Scaling Governor is ${GOV}"
