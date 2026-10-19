#!/bin/sh
#
# Homebrew
#
# This installs Homebrew if it's missing.

# Check for Homebrew
if ! command -v brew > /dev/null && [ ! -x /opt/homebrew/bin/brew ] && [ ! -x /usr/local/bin/brew ]
then
  echo "  Installing Homebrew for you."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

exit 0
