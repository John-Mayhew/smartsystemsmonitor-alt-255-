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
# Date Created: 23/03/2023
# Date of Version Completion: 28/03/2023
#
# Description:
# This script is created to change frequencies and then the speed of the CPU.
# This script works along side cpuInfo.sh and setGov.sh, which are used to change the governor and CPU speeds.
# Initial script has been taken from Seb Blair. Changes have been made to 
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
FREQ=$1
CPUDIR="/sys/devices/system/cpu/"
MAX="scaling_max_freq"
MIN="scaling_min_freq"
# this is used to make the min and max the same as one another so that scaling is the same.
CORES=$(lscpu | grep -w "CPU(s):*" | awk 'NR==1 {print$2}')
# counts and lists the number of CPU cores
sudo echo
for (( c=0; c<${CORES}; c++))
do
    echo -e ${FREQ} > ${CPUDIR}cpu${c}/cpufreq/${MIN}

    echo -e ${FREQ} > ${CPUDIR}cpu${c}/cpufreq/${MAX}
done

