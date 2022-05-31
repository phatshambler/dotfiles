alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias use-php8='brew unlink php@7.4 && brew link php@8.0 --force && composer global update && valet use php@8.0 --force'

alias use-php7='brew unlink php && brew link php@7.4 --force && composer global update && valet use php@7.4 --force'
