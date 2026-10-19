function use-php7
    brew unlink php && brew link php@7.4 --force && composer global update && valet use php@7.4 --force
end