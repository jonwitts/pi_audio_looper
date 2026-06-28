#!/bin/bash

# A simple Audio Looper for the Raspberry Pi
#
# author:  Jon Witts
# license: GPL-3.0, see LICENSE included in this package
#
# A Bash Audio Looper for the Raspberry Pi and a Python3 shutdown button and LED indicator
# https://github.com/jonwitts/pi_audio_looper

# stop the cursor blinking and clear the screen
setterm --cursor off
clear

# create mount point
sudo mkdir /media/sda1

# now mount the USB drive
sudo mount /dev/sda1 /media/sda1

# now search the USB drive for mp3 files
shopt -s nullglob
for file in /media/sda1/*.mp3 ; do
    filePlay=$file
done

# now play the last audio file found, looping it with omxplayer
omxplayer -b --loop --adev local "$filePlay"
