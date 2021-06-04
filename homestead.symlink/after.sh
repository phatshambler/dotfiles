#!/bin/sh
# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# run apt-get update first, without it I was getting errors not finding the extensions
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:chris-needham/ppa --yes
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes update
# Install extensions
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install php-xdebug
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install php7.1-gd php7.2-gd php7.3-gd php7.4-gd php-gd
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install php-imagick

# Install packages
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install pulseaudio
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install ffmpeg
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install audiowaveform
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install otf-trace
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install woff-tools
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install fontforge
sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install default-jre

#WOFF2
if [ ! -f /usr/local/bin/woff2_compress ]; then
    cd $HOME
    git clone --recursive https://github.com/google/woff2.git
    cd woff2
    make clean all
    sudo ln -s $HOME/woff2/woff2_* /usr/local/bin/
fi

# TTf2EOT
if [ ! -f /usr/local/bin/ttf2eot ]; then
    cd $HOME
    git clone https://github.com/wget/ttf2eot.git
    cd ttf2eot
    make
    sudo ln -s $HOME/ttf2eot/ttf2eot /usr/local/bin/
fi

# sfnt2woff
if [ ! -f /usr/local/bin/sfnt2woff ]; then
    cd $HOME
    git clone https://github.com/wget/sfnt2woff.git
    cd sfnt2woff
    make
    sudo ln -s $HOME/sfnt2woff/sfnt2woff /usr/local/bin/
    sudo ln -s $HOME/woff2sfnt/woff2sfnt /usr/local/bin/
fi

#css3FontConverter
if [ ! -f /usr/local/bin/convertFonts.sh ]; then
    cd $HOME
    git clone https://github.com/zoltan-dulac/css3FontConverter.git
    sudo ln -s $HOME/css3FontConverter/convertFonts.sh /usr/local/bin/
fi

# Update locales
sudo locale-gen fr_CA
sudo locale-gen fr_CA.UTF-8
sudo locale-gen en_CA
sudo locale-gen en_CA.UTF-8
sudo update-locale

# Restart PHP FPM
sudo systemctl restart php7.1-fpm
sudo systemctl restart php7.2-fpm
sudo systemctl restart php7.3-fpm
sudo systemctl restart php7.4-fpm
