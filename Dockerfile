FROM wordpress:6-php8.3-fpm-alpine

WORKDIR /usr/src/wordpress

RUN rm -rf ./wp-content/themes/*/
RUN cp wp-config-docker.php wp-config.php

# Disable automatic update of wordpress core
RUN echo "define('WP_AUTO_UPDATE_CORE', false);" >> wp-config.php

# Copy theme files
COPY theme ./wp-content/themes/custom-theme/

COPY setup.sh .
ENTRYPOINT [ "./setup.sh" ]
