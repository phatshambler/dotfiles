# Interactive tools
status is-interactive; or return

# zoxide: `z <part of a path>` jumps to the most used matching directory,
# `zi` picks one with fzf
if type -q zoxide
    zoxide init fish | source
end

# eza for the long listings (fish's own ll and la use ls)
if type -q eza
    alias ll 'eza -lh --git --group-directories-first'
    alias la 'eza -lah --git --group-directories-first'
    alias lt 'eza --tree --level=2 --group-directories-first'
end
