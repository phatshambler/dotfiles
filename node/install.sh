npm_global="yo gulp grunt-cli react-native cordova yarn spoof pm2 @babel/cli lerna"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install lts/*
nvm use lts/*
nvm alias default lts/*
npm update -g npm
npm install -g $npm_global

exit 0
