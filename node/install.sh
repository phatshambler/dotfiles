npm_global="yo gulp grunt-cli react-native cordova yarn spoof pm2 @babel/cli lerna"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install lts/*
nvm use lts/*
nvm alias default lts/*
npm update -g npm
npm install -g $npm_global

exit 0
