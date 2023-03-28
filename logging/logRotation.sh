# Rotates logs if current log is over 100 lines
LOG_ROTATION(){
    local log_size=$(wc -l $LOGFILE | awk '{print $1}')
    local count_log_files=$(ls ${LOGFILE%/*} | grep "${LOGFILE##/*}.*.gz" | wc -l )
    if [[ ${log_size} -gt 100 ]]; then
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
