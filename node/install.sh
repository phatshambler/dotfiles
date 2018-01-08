curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

npm_global="bower yo gulp grunt-cli react-native cordova yarn spoof"

export NVM_DIR=~/.nvm
if [ ! -d "$NVM_DIR" ]; then
    mkdir $NVM_DIR
fi

source $(brew --prefix nvm)/nvm.sh

nvm install 8
nvm use 8
nvm alias default 8
npm update -g npm
npm install -g $npm_global

exit 0
