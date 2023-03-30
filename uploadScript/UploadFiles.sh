#! usr/bin/env bash


picUpload=$(sshpass -p 'guest' rsync -rv /*.jpg guest@10.150.200.112:/mnt/NAS/Alt255/Pictures)
gasUpload=$(sshpass -p 'guest' rsync -rv /*.csv guest@10.150.200.112:/mnt/NAS/Alt255/gasSensor)
tempUpload=$(sshpass -p 'guest' rsync -rv readings.txt guest@10.150.200.112:/mnt/NAS/Alt255/tempHumidSensor)

cd /home/pi/github/smartsystemsmonitor-alt-255/camera/pictures

${picUpload}

cd /home/pi/github/smartsystemsmonitor-alt-255

# ----

cd /home/pi/github/smartsystemsmonitor-alt-255/gasSensor

${gasUpload}

cd /home/pi/github/smartsystemsmonitor-alt-255

# ---

cd /home/pi/github/smartsystemsmonitor-alt-255/tempHumidSensors

${tempUpload}

cd /home/pi/github/smartsystemsmonitor-alt-255
