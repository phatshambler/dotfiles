# nvm takes ~500 ms to load, so it's only loaded the first time `nvm` is
# called. Until then, the default node version is put on the PATH directly.
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if [[ -s $NVM_DIR/nvm.sh ]]
then
  # Resolve the default alias (e.g. "24" or "lts/*") to the newest matching
  # installed version
  if [[ -f $NVM_DIR/alias/default ]]
  then
    nvm_default=$(<$NVM_DIR/alias/default)
    while [[ -f $NVM_DIR/alias/$nvm_default ]]
    do
      nvm_default=$(<$NVM_DIR/alias/$nvm_default)
    done
    nvm_default_dirs=($NVM_DIR/versions/node/v${nvm_default#v}(|.*)(N/nOn))
    if (( $#nvm_default_dirs ))
    then
      export PATH="$nvm_default_dirs[1]/bin:$PATH"
    fi
    unset nvm_default nvm_default_dirs
  fi

  nvm() {
    unfunction nvm
    source $NVM_DIR/nvm.sh --no-use
    nvm "$@"
  }
fi
