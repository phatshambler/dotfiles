npm_global="bower yo gulp grunt-cli react-native cordova yarn spoof pm2 @babel/cli"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install lts/*
nvm use lts/*
nvm alias default lts/*
npm update -g npm
npm install -g $npm_global

exit 0
