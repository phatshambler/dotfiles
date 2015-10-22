#!/bin/sh
#
# Compass
#
# This installs Compass.

# Check for Compass
if test ! $(which compass)
then
  echo "  Installing Compass for you."
  gem install compass sass
fi

gem install scss-lint

rbenv rehash

exit 0
