
# **U14553-alt 255**

## Introduction

This is a monitoring system that is designed to take photos at 30 minute intervals while gathering data from sensors to ensure the Raspberry Pi 4 does not overheat. Readings from a temperature and humidity sensor alongside a gas sensor are taken during the same 30 minutre intervals as the camera as to help prevent overheating.
The images are then uploaded to the CCCU cloud storage network.

Within this system is a logging function that creates a record of when actions have been run and what they are for. This includes when changes are found in the github repository, through the use of Crontab, or when scripts are run to take a picture and when the environmental readings have been taken. The logging system saves the logs in a log.txt file using the ISO 8601 standard for Date and Time, and logging format.

Both power consumption and processing speed has been considered when designing this system so that it runs smoothly without the consumption of too much resources. There is a script that allow the frequency to be changed to the frequency requested by the system as well as another that will allow the governor to be changed to see if there is any difference when it is running. One of things we need to consider and take into account when doing this is that we do not wish to overheat the Raspberry Pi by speeding up the clock speed, which results in the required use of gas, temperature and humidity sensors in this monitoring system.

## Prerequisites:
* Python3 and the component PIP3 is used in the gas and temperature monitoring script monitoring script.



_Designed to work on Rasberry Pi OS lite 64 bit._

## Installation: 

## Other:
Version 1.0

## **Contributors:**

:man_technologist: **About John Mayhew:**  
[jm1460@Canterbury.ac.uk](jm1460@Canterbury.ac.uk)
- I am a Cyber Forensics and Computer security undergradute, I have limited prior experience in bash, however, welcome the challenge of learning new coding languages 

---

:woman_technologist: **About CJ Wilson:**  
[cw831@canterbury.ac.uk](c.wilson831@canterbury.ac.uk)
-	I am studying Cyber forensics and Computer security, and in my free time, I like to cosplay.
-	You can reach me through my LinkedIn profile: [![Linkedin Badge](https://img.shields.io/badge/-CJ-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/claricejessicawilson/)

---

**:man_technologist: About Oliver Rush-Gadsby:**  
[or56@canterbury.ac.uk](or56@canterbury.ac.uk)
- I am xxxx

---


**:woman_technologist: About Cameron Browne:**  
[cb1258@canterbury.ac.uk](cb1258@canterbury.ac.uk)
- I am a Computer Forensics and Security student. Though I have had some practice, I also do not have a large amount of experience in bash but am very happy to learn and widen my knowledge of it as well as gaining a better understanding of how to use GitHub. 

