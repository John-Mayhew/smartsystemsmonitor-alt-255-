U14553-alt 255
====
<br>

# Introduction:

This is a monitoring system that is designed to take photos and readings from sensors at 30 minute intervals. This time period was chosen to prevent thermal issues being experience by the Raspberry Pi whilst the process load is minimal. There are 3 sensors in place (temperature, humidity and gas) each measuring an individual variable that can go wrong whilst 3d Printing. The readings and images from the sensors and camera are then uploaded to the CCCU cloud storage network.

Part of this system is a cycled logging function, used to record predefined actions should errors occur or a process not be started/completed - This log file includes a timestamp of when the actions were completed in-line with the ISO 8601 standard. Included logging events are: <br>
* Scheduled check with Github to search for updated.
* The Result of the Github query, and whether an update is required. 
* Fail markers for the Github reposity update. 
* When an image is taken.
* When the oldest image is deleted.
* When the gas, temperature, and humidity sensors take readings. 
* When the CPU frequency is decreased/increased
<br>

The primary considerations was the management of system resources, power consumption, and the thermal implications of running the device at maximum performance. The presense of passive cooling on the Raspberry Pi meant that if the system resources were not managed, there would be issues with overheating and general stability of the device - this is not something that could be allowed in a monitoring system. The solution to thermal, and power issues was the incorporation of a CPU frequency scaling script. This script is used to change the CPU frequency on a schedule in-line with the tasks the Raspberry Pi is required to perform. 5 minutes before the hour the CPU frequency is increased so that the Github update query can be completed and then the Raspberry Pi will be slowed down once the tasks have been completed. We have made the decision to not speed up the Raspberry Pi when it is gathering information from the sensors and taking pictures because we do not deem this to be an intensive task and chose to priorities the stability of the device over the increased performance gain. 

<br><br>

# Prerequisites and Version:
**Current Version:** 1.0.0  
* Python3 and the component PIP3 is used in the gas and temperature monitoring script monitoring script.
* [Seeed Python DHT](https://github.com/Seeed-Studio/Seeed_Python_DHT) - Provides for Tempeture and Humidity Sensory support (Version 0.0.2)  
  * [Grove.py (Required by Seeed Python DHT)](https://github.com/Seeed-Studio/grove.py) - Provides support for Gas sensor, Tempeture and Humidity sensor (Version 0.6)  
* [GrovePi](https://github.com/DexterInd/GrovePi) by Dexter Industries - A library required to use the Grove sensors on the Raspberry Pi (Version 1.4.0)  

<br>_Designed to work on Rasberry Pi OS lite 64 bit. Not tested on additional Operating Systems. Debian 11 (Bullseye) systems may function but require additional packages to be installed prior to use._

<br><br>

# Installation:

First clone the repository on to your device using the following line of code, This will need to be run when you are already in the location that you will want to store the Github Repository - _You will need to alter any paths used in the script if this is not performed in the home user directory on a Raspberry Pi (Using Raspian OS Lite) or if the username of the device has been altered.
```Shell
git clone https://github.com/cccu-uk/smartsystemsmonitor-alt-255.git
```

<br>
Once the reposity has been cloned you will need to alter any scripts declaring the path name, to ensure that they are applicable to the working environment on your machine or the location that the repository has been installed. an example of this is the following line as shown currently in the logging function used by the logging script.

```Shell
logfile=/home/pi/github/smartsystemsmonitor-alt-255/logging/log.txt # Change to the path where you cloned the repository. 
```

<br><br>

# Contribution:

:man_technologist: **John Mayhew:**  
_Email: [jm1460@Canterbury.ac.uk](jm1460@Canterbury.ac.uk)_
- I am a Computer Forensics and Cyber security undergradute, I have limited prior experience in bash, however, welcome the challenge of developing my skills in an coding language that I am not familiar with. I have prior experience in Github, and other coding languages and therefore am looking forward to further incorporate this understanding in the development of a project that will be used to better a working environment.  

----

:woman_technologist: **CJ Wilson:**  
_Email: [cw831@canterbury.ac.uk](c.wilson831@canterbury.ac.uk)_
-	I am studying Computer Forensics and Cyber security, and in my free time, I like to cosplay.
-	You can reach me through my LinkedIn profile: [![Linkedin Badge](https://img.shields.io/badge/-CJ-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/claricejessicawilson/)

---

**:man_technologist:  Oliver Rush-Gadsby:**  
_Email: [or56@canterbury.ac.uk](or56@canterbury.ac.uk)_
- I am currently studying Computer Forensics and Security as an undergraduate. I have little knowledge and experience in using bash and other similar languages although I am willing to amend this and improve my understanding around it aswell as the project development aspect also. 

---


**:woman_technologist: Cameron Browne:**  
_Email: [cb1258@canterbury.ac.uk](cb1258@canterbury.ac.uk)_
- I am a Computer Forensics and Cyber security student. Though I have had some practice, I also do not have a large amount of experience in bash but am very happy to learn and widen my knowledge of it as well as gaining a better understanding of how to use GitHub. 
