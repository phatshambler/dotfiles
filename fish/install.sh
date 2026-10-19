#!/bin/sh
#
# Install the fish plugins listed in fish/fish.config.symlink/fish_plugins
# (fisher itself included).

if command -v fish > /dev/null
then
  fish -c 'type -q fisher; or curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; fisher update'
fi

exit 0
