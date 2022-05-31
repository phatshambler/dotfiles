
#Artisan
alias art='php artisan'
alias art-migrate='php artisan migrate'
alias art-migrate-new='php artisan migrate-new'

alias use-php8='brew unlink php@7.4 && brew link php --force && composer global update && valet use php --force'
alias use-php7='brew unlink php && brew link php@7.4 --force && composer global update && valet use php@7.4 --force'
