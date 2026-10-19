
#Artisan
alias art='php artisan'
alias art-migrate='php artisan migrate'
alias art-migrate-new='php artisan migrate-new'

alias use-php8='brew unlink php@8.3 && brew link php --force && composer global update && valet use php --force'
alias use-php83='brew unlink php && brew link php@8.3 --force && composer global update && valet use php@8.3 --force'
alias use-php84='brew unlink php && brew link php@8.4 --force && composer global update && valet use php@8.4 --force'
alias use-php7='brew unlink php && brew link php@7.4 --force && composer global update && valet use php@7.4 --force'
alias use-php71='brew unlink php && brew link php@7.1 --force && composer global update && valet use php@7.1 --force'
