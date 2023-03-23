# John Mayhew           |       <jm1460@canterbury.ac.uk>
# Cameron Browne        |       <cb1258@canterbury.ac.uk>
# Cj Wilson             |       <c.wilson831@canterbury.ac.uk>
# Oliver Rushgadsby     |       <or56@canterbury.ac.uk>
#
# Version 1.0
# Date Created: 23/03/2023
# Date of Version Completion:
#
# Description:
# This script is designed to check for the amount of images stored in the picture dirctory, and if there is 48 images, it will sort the images and delete the oldest one.   
# This is to help with memory management on the system.
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------ Logging
source /home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh # Pulls the funciton script for logging
 
# -------------Image removal
 if [[ $(find /home/pi/github/smartsystemsmonitor-alt-255/camera/pictures -type f | wc -l)  -gt 48 ]]; then #Check the amount of files in the picture directory                 
        #if it is greater than 48, it will do the following.
 {
   cd home/pi/github/smartsystemsmonitor-alt-255/camera/pictures
   ls -tf *.jpg > /home/pi/github/smartsystemsmonitor-alt-255/camera/ReverseFiles.txt    #list files in reverst time order and save them to the file
   OLDEST=$( tail -n 1 ReverseFiles.txt)        #sets the first value in the file as OLDEST
   echo "${OLDEST}"

  # Prints the current actions to the log.txt file. Picture directory: home/pi/github/smartsystemsmonitor-alt-255/camera/pictures
   LOGGING "- Oldest image removing from the Picture directory: $OLDEST."
   rm ${OLDEST}   #deletes the oldest file
   LOGGING "-Oldest image has been removed: $OLDEST."   #Prints the deletion to log.txt
 }
 fi
