#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

sudo add-apt-repository ppa:chris-needham/ppa
sudo apt-get update
sudo apt-get -y install chromium-browser xvfb pulseaudio ffmpeg libfdk-aac-dev php-mcrypt audiowaveform php-imagick traceroute

sudo locale-gen fr_CA
sudo locale-gen fr_CA.UTF-8
sudo update-locale
