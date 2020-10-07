FROM php:7.4-fpm-alpine

RUN apk add --no-cache \
    # Install OS level dependencies
    curl icu-dev mariadb-client \
    # Install PHP dependencies
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
