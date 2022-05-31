if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
rbenv install 2.7.4
rbenv global 2.7.4

gem install bundler
rbenv rehash

exit 0
