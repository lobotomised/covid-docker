FROM lobotomised/docker-php-base:latest

RUN apk add --update \
    gmp-dev \
    && rm -rf /var/cache/apk/*

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gmp

COPY /docker/php/php.ini /usr/local/etc/php/conf.d/custom.ini

WORKDIR /code

RUN git clone https://github.com/lobotomised/covid . \
    && git rev-parse HEAD > commit_sha \
    && composer install --prefer-dist --no-dev --no-ansi --no-interaction --no-progress --no-scripts --optimize-autoloader \
    && composer clear-cache --no-ansi \
    && npm install \
    && npm run production \
    && rm -rf node_modules

COPY /docker/php/startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

ENTRYPOINT ["/bin/sh", "/root/startup.sh"]
