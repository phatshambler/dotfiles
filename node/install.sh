brew install nvm

export NVM_DIR=~/.nvm
if [ ! -d "$NVM_DIR" ]; then
    mkdir $NVM_DIR
fi

source $(brew --prefix nvm)/nvm.sh

nvm install 0.12
nvm install 4
nvm install latest

nvm use 0.12
npm update -g npm
npm install -g bower yo gulp grunt-cli

nvm use 4
npm update -g npm
npm install -g bower yo gulp grunt-cli

nvm use latest
npm update -g npm
npm install -g bower yo gulp grunt-cli react-native

nvm use latest
nvm alias default latest


exit 0
