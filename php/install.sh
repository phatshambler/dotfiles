export PHP_PATH="/Applications/MAMP/bin/php/php5.6.10"
export PATH="$PHP_PATH/bin:$PATH"

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

pecl config-set php_ini "$PHP_PATH/conf/php.ini"
pear config-set php_ini "$PHP_PATH/conf/php.ini"
