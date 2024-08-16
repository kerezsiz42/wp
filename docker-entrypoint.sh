#!/bin/sh

# Replace /var/www/html with contents of /workdir
rm -rf /var/www/html/*
cp -a /workdir/* /var/www/html/
cd /var/www/html

use_env_var_in_config() {
    sed -i "s/define( *'$1', *'[^']*' *);/define( '$1', '$2' );/" wp-config.php
}

use_env_var_in_config DB_NAME $DB_NAME
use_env_var_in_config DB_USER $DB_USER
use_env_var_in_config DB_PASSWORD $DB_PASSWORD
use_env_var_in_config DB_HOST $DB_HOST

exec docker-php-entrypoint php-fpm
