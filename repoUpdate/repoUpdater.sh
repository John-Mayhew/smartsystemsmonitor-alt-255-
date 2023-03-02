#! /usr/bin/env bash
#! /bin/sh

cd /home/pi/github/smartsystemsmonitor-alt-255/repoUpdate/

echo "test working" >> log.txt

git fetch > fetchResult.txt

#Upstream = ${1:-'@{u}'}
#Local = $(git rev-parse @)
#Remote = $(git rev-parse "$Upstream")
#Base = $(git merge-base @ "$Upstream")

#if [$Local = $Remote]; then
	#echo "Repository Up-to-Date"
