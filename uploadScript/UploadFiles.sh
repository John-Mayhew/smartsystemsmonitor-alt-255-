#! usr/bin/env bash

Pictures=$(ls -l /home/pi/github/smartsystemsmonitor-alt-255/camera/pictures/*.jpg)
Sensors=$(/home/pi/github/smartsystemsmonitor-alt-255/logging/*.csv)


sshpass -p 'guest' rsync -rv ${Pictures} guest@10.150.200.112:/mnt/NAS/Data/2023/Alt255/Pictures

sshpass -p 'guest' rsync -rv ${Sensors} guest@10.150.200.112:/mnt/NAS/Data/2023/Alt255/Sensors

