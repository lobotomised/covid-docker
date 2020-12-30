FROM php:8.0-fpm-alpine

RUN apk add --no-cache \
    curl \
    icu-dev \
    gmp-dev \
    mariadb-client \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gmp

RUN touch crontab.tmp \
    && echo '* * * * * php /code/artisan schedule:run' > crontab.tmp \
    && crontab -u www-data crontab.tmp \
    && rm -rf crontab.tmp

COPY /docker/php-cron/startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

VOLUME "/code"
WORKDIR /code

ENTRYPOINT ["/bin/sh", "/root/startup.sh"]
