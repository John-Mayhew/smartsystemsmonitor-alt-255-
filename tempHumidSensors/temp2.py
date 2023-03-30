import os
import time
from datetime import datetime
import csv
import seeed_dht

directory = "/home/pi/github/smartsystemsmonitor-alt-255/logging"
filename = "readings.csv"
file_path = os.path.join(directory, filename)

def main():
	# for DHT22 sensor
	sensor = seeed_dht.DHT("22", 12)

	with open(file_path, 'w', newline='') as file:
		writer = csv.writer(file)
		writer.writerow(["Timestamp", "Temperature", "Humidity"])

		while True:
			humi, temp = sensor.read()
			if not humi is None:
				timestamp = datetime.utcnow().isoformat()
				print('humidity {1:.1f}%, temperature {2:.1f}*'.format(sensor.dht_type, humi, temp))
				writer.writerow([timestamp, humi, temp])
			else:
				print('DHT{0}, humidity & temperature: {1}'.format(sensor.dht_type, temp))
		time.sleep(1)

if __name__ == '__main__':
	main()
