#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# run apt-get update first, without it I was getting errors not finding the extensions
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes update

# Install extensions
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install php7.0-xdebug php7.1-xdebug php-xdebug
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install php7.0-gd php7.1-gd php-gd
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install php7.0-imagick php7.1-imagick php-imagick

# Install packages
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install chromium-browser
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install xvfb
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install pulseaudio
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install ffmpeg
source ./audiowaveform.sh

# Update locales
sudo locale-gen fr_CA
sudo locale-gen fr_CA.UTF-8
sudo locale-gen en_CA
sudo locale-gen en_CA.UTF-8
sudo update-locale

# Restart PHP FPM
sudo systemctl restart php7.0-fpm
sudo systemctl restart php7.1-fpm
sudo systemctl restart php7.2-fpm
