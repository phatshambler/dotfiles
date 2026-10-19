# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && [[ -f $HOMEBREW_PREFIX/etc/grc.zsh ]]
then
  source $HOMEBREW_PREFIX/etc/grc.zsh
fi
