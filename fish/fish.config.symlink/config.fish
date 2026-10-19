# Default node version on the PATH, without loading nvm (see load_nvm for
# .nvmrc support)
_nvm_use_default

# pyenv's python first (see conf.d/pyenv.fish)
fish_add_path --global --move --path $PYENV_ROOT/shims

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    load_nvm
end

# Keep pyenv's python out of Homebrew builds
alias brew="env PATH=(string replace $PYENV_ROOT/shims '' \"\$PATH\") brew"

# Added by Antigravity
# fish_add_path /Users/nicolas/.antigravity/antigravity/bin

# bind \e\x7f backward-kill-word

set -gx EDITOR nvim
