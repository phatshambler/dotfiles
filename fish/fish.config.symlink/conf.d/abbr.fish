# Abbreviations expand as you type (gca + space -> git commit -am), so the
# full command is what ends up in the history. Ported from the zsh aliases
# of the dotfiles (git/aliases.zsh, php/aliases.zsh, docker/aliases.zsh).
status is-interactive; or return

# git
abbr --add g git
abbr --add gs git status -sb
abbr --add gc git commit
abbr --add gca git commit -am
abbr --add gac 'git add -A && git commit -m'
abbr --add gco git checkout
abbr --add gcb git copy-branch-name
abbr --add gb git branch
abbr --add gd git diff
abbr --add gl git pull --prune
abbr --add gp git push origin HEAD
abbr --add glog "git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# PHP / Laravel
abbr --add art php artisan
abbr --add sail 'test -f sail && bash sail || bash vendor/bin/sail'

# Docker
abbr --add d docker
abbr --add d-c docker compose
