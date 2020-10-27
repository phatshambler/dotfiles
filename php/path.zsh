export COMPOSER_BIN_PATH="/Users/$(whoami)/.composer/vendor/bin"
export PHP_PATH="$(brew --prefix php@7.0)/bin"
export PHP_PATH="$(brew --prefix php@7.3)/bin"
export PATH="$COMPOSER_BIN_PATH:$PHP_PATH:$PATH"
