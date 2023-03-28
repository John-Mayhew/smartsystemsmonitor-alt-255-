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
# This script is created to output frequency information about the CPU and will also include what governor is currently set. 
# This script works along side setSpeed.sh and setGov.sh, which are used to change the governor and CPU speeds.
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- Declaring Variables

CPUDIR=/sys/devices/system/cpu/cpu0/cpufreq/
NTHCORE=$(lscpu | grep -w "CPU(s):*" | awk 'NR==1 {print$2}') 
COLUMNS=''
HEADER="SCPU Policies\t| CORES 0:${NTHCORE}-->"
# finding and acknowledging all cores

for (( c=0; c<=${NTHCORE}; c++ ))
do
  COLUMNS="${COLUMNS} -"
done

echo -e ${HEADER}

for i in ${CPUDIR}{cpuinfo,scaling}_*; do 
  PNAME=$(basename $i)
#do not include these
  [[ "${PNAME}" == *available* ]] || [[ "${PNAME}" == *transition* ]] || \
  [[ "${PNAME}" == *driver* ]]    || [[ "${PNAME}" == *setspeed* ]] && continue

  echo "${PNAME}: "

  for (( j=0; j<${NTHCORE}; j++ ))
  do
    KPARAM=$(echo $i | sed "s/cpu0/cpu$j/") 
    cat "${KPARAM}"
  done
done | paste ${COLUMNS} | column -t
# print frequency information and what governor is set.
