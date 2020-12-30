FROM php:8.0-fpm-alpine

RUN apk add --update \
    git \
    icu-dev \
	gmp-dev \
	mariadb-client \
	npm \
    && rm -rf /var/cache/apk/*

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install gmp

COPY /docker/php/php.ini /usr/local/etc/php/conf.d/custom.ini

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer

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
