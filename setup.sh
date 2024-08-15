#!/bin/sh

# Replace /var/www/html with contents of /usr/src/wordpress
rm -rf /var/www/html/*
cp -a /usr/src/wordpress/* /var/www/html/

exec /usr/local/bin/docker-entrypoint.sh php-fpm
