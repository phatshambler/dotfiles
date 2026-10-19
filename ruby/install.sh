if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Latest stable Ruby known to ruby-build
ruby_version=$(rbenv install --list 2>/dev/null | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | tail -1)

rbenv install --skip-existing "$ruby_version"
rbenv global "$ruby_version"

gem install bundler
rbenv rehash

exit 0
