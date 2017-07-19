curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

/usr/local/bin/composer global require "squizlabs/php_codesniffer=*"
/usr/local/bin/composer global require "phpunit/phpunit=5.5.*"
/usr/local/bin/composer global require "laravel/envoy"
/usr/local/bin/composer global require "vlucas/phpdotenv"
