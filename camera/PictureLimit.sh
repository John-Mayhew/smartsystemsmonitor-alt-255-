# John Mayhew           |       <jm1460@canterbury.ac.uk>
# Cameron Browne        |       <cb1258@canterbury.ac.uk>
# Cj Wilson             |       <c.wilson831@canterbury.ac.uk>
# Oliver Rush-Gadsby     |       <or56@canterbury.ac.uk>
#
# Version 1.0
# Date Created: 23/03/2023
# Date of Version Completion: 30/03/2023
#
# Description:
# This script is designed to check for the amount of images stored in the picture dirctory, and if there is 48 images, it will sort the images and delete the oldest one.   
# This is to help with memory management on the system.
#
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------ Logging
source /home/pi/github/smartsystemsmonitor-alt-255/logging/./logging.sh # Pulls the funciton script for logging
CAMERADIR=/home/pi/github/smartsystemsmonitor-alt-255/camera/ #camera directory to simplify code

# -------------Image removal

 while [  $(find /home/pi/github/smartsystemsmonitor-alt-255/camera/pictures -type f | wc -l) -gt 48 ]
 do #Check the amount of files in the picture directory                 
        #if it is greater than 48, it will do the following.
 
   sed -i 'd' ${CAMERADIR}ReverseFiles.txt # Clear the old list of files in the ReverseFiles.txt
   ls -t ${CAMERADIR}pictures/*.jpg > ${CAMERADIR}ReverseFiles.txt    #list files in time order and save them to the file
   OLDEST=$( tail -n 1 < ${CAMERADIR}ReverseFiles.txt)        #sets the last value in the file as OLDEST
   echo "${OLDEST}"

  # Prints the current actions to the log.txt file. Picture directory: home/pi/github/smartsystemsmonitor-alt-255/camera/pictures
   LOGGING "- Oldest image removing from the Picture directory: $OLDEST."
   cd /home/pi/github/smartsystemsmonitor-alt-255/camera/pictures # Move to picture directory
   rm -f ${OLDEST}   #deletes the oldest file
   LOGGING "-Oldest image has been removed: $OLDEST."   #Prints the deletion to log.txt
   cd /home/pi/github/smartsystemsmonitor-alt-255 # Moves back to base directory
 
 done
