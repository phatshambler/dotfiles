export COMPOSER_BIN_PATH="/Users/$(whoami)/.composer/vendor/bin"
export PHP_PATH="$(brew --prefix php@7.1)/bin"
export PATH="$COMPOSER_BIN_PATH:$PHP_PATH:$PATH"
