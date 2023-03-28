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
# Date Created: 28/03/2023
# Date of Version Completion:
#
# Description:
# This script is for the log rotation; it is used to remove every line after the 100th line to keep the log file clean and up to date. 
#
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------- Declaring Variables# Rotates logs if current log is over 100 lines
LOG_ROTATION(){
    local log_size=$(wc -l $LOGFILE | awk '{print $1}')
    local count_log_files=$(ls ${LOGFILE%/*} | grep "${LOGFILE##/*}.*.gz" | wc -l )
    if [[ ${log_size} -gt 100 ]]; then # remove the 100th line in order to fit new information.
        if [ ${count_log_files} -gt 0 ]; then
            for ((i=${count_log_files}; i!=0; i--)); do
                    local n=$((${i}+1))
                    mv ${LOGFILE}.${i}.gz ${LOGFILE}.${n}.gz
            done
        fi
        gzip -c "${LOGFILE}" > "${LOGFILE}.1.gz"
        echo "" > ${LOGFILE}
   fi
}
