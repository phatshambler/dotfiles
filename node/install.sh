brew install nvm

export NVM_DIR=~/.nvm
if [ ! -d "$NVM_DIR" ]; then
    mkdir $NVM_DIR
fi

source $(brew --prefix nvm)/nvm.sh

nvm install v0.12.7
nvm install v4.2.4
nvm install v5.4.0

nvm use v0.12.7
npm update -g npm
npm install -g bower yo gulp grunt-cli

nvm use v4.2.4
npm update -g npm
npm install -g bower yo gulp grunt-cli

nvm use v5.4.0
npm update -g npm
npm install -g bower yo gulp grunt-cli

nvm use v4.2.4
nvm alias default v4.2.4


exit 0
