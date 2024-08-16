FROM composer:2.7 AS build

WORKDIR /workdir
COPY composer.json composer.lock ./
RUN composer install

FROM php:8.3-fpm-alpine

RUN docker-php-ext-install mysqli

WORKDIR /workdir

# Copy dependencies installed by composer
COPY --from=build /workdir/wordpress ./
COPY theme ./wp-content/themes/custom-theme/
RUN cp wp-config-sample.php wp-config.php

RUN printf "\n# Disable automatic update of wordpress core\ndefine('WP_AUTO_UPDATE_CORE', false);\n" >> wp-config.php

COPY docker-entrypoint.sh ./
ENTRYPOINT [ "./docker-entrypoint.sh" ]
