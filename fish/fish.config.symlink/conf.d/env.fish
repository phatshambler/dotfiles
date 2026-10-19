# Environment and PATH. These used to live only in universal variables
# (fish_variables), which aren't versioned. fish_add_path skips directories
# that don't exist or are already on the PATH.
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PYENV_ROOT $HOME/.pyenv

fish_add_path --global \
    /opt/homebrew/opt/ffmpeg-full/bin \
    $ANDROID_HOME/platform-tools \
    $ANDROID_HOME/emulator \
    $HOME/.antigravity/antigravity/bin \
    /opt/homebrew/sbin \
    /opt/homebrew/opt/python/libexec/bin \
    $HOME/.composer/vendor/bin \
    /opt/homebrew/bin

# Scripts of the dotfiles (git-up, git-copy-branch-name, e, search…)
fish_add_path --global --append $HOME/.dotfiles/bin
