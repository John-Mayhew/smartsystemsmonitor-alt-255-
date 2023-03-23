# change the operating freq of nodes update min and max to be the same to ensure true speed. 
FREQ=$1
CPU="/sys/devices/system/cpu/"
MAX="scaling_max_freq"
MIN="scaling_min_freq"

CORES=$(lscpu | grep -w "CPU(s):*" | awk 'NR==1 {print$2}')
# make sure in sudo mode
sudo echo
for (( c=0; c<${CORES}; c++))
do
    echo -e ${FREQ} > ${CPUDIR}cpu${C}/cpufreq/${MIN}
    echo -e ${FREQ} > ${CPUDIR}cpu${C}/cpufreq/${MAX}
done
