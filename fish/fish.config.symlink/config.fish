if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (starship init fish)
    load_nvm > /dev/stderr
end

alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"

pyenv init - fish | source

# Added by Antigravity
# fish_add_path /Users/nicolas/.antigravity/antigravity/bin

# bind \e\x7f backward-kill-word

set -gx EDITOR nvim
