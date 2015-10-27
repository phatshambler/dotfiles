brew install nvm

export NVM_DIR=~/.nvm
if [ ! -d "$NVM_DIR" ]; then
    mkdir $NVM_DIR
fi

source $(brew --prefix nvm)/nvm.sh

nvm install v0.12.7
nvm install v4.1.1

nvm use v0.12.7
npm update -g npm
npm install -g bower yo gulp grunt-cli

nvm use v4.1.1
npm update -g npm
npm install -g bower yo gulp grunt-cli

nvm use v0.12.7
nvm alias default v0.12.7


exit 0
