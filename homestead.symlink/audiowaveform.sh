#!/bin/sh

sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install git make cmake gcc g++ libgd-dev cmake libmad0-dev libid3tag0-dev libsndfile1-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev
git clone https://github.com/bbc/audiowaveform.git
cd audiowaveform
wget https://github.com/google/googletest/archive/release-1.8.0.tar.gz
tar xvzf release-1.8.0.tar.gz
rm release-1.8.0.tar.gz
ln -s googletest-release-1.8.0/googletest googletest
ln -s googletest-release-1.8.0/googlemock googlemock
mkdir build
cd build
cmake ..
make
