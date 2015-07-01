#!/bin/sh
#
# Compass
#
# This installs Compass.

# Check for Compass
if test ! $(which compass)
then
  echo "  Installing Compass for you."
  sudo gem install compass sass
fi

sudo gem install scss-lint

exit 0
