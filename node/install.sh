npm_global="pm2"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if [ ! -s "$NVM_DIR/nvm.sh" ]
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | PROFILE=/dev/null bash
fi

\. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts
nvm alias default 'lts/*'
nvm use default
npm install -g npm $npm_global

exit 0
