#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

sudo apt-get -y install chromium-browser xvfb pulseaudio ffmpeg libfdk-aac-dev

php /home/vagrant/Code/ffframe.com/artisan migrate

php /home/vagrant/Code/manivelle/backend/artisan migrate

php /home/vagrant/Code/telecommande/artisan migrate

php /home/vagrant/Code/archives.nte.qc.ca/artisan migrate

sudo locale-gen fr_CA
sudo locale-gen fr_CA.UTF-8
sudo update-locale
