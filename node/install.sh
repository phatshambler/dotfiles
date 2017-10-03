npm_global="bower yo gulp grunt-cli react-native cordova yarn spoof"

export NVM_DIR=~/.nvm
if [ ! -d "$NVM_DIR" ]; then
    mkdir $NVM_DIR
fi

source $(brew --prefix nvm)/nvm.sh

nvm use latest
npm update -g npm
npm install -g $npm_global

nvm use latest
nvm alias default latest

exit 0
