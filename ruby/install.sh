brew install rbenv ruby-build
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
rbenv install 2.2.3
rbenv global 2.2.3

gem install bundler
rbenv rehash

exit 0
