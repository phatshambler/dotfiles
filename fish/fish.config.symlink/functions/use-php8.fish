function use-php8
    brew unlink php@7.4 && brew link php --force && composer global update && valet use php --force
end