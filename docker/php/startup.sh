#!/bin/sh
set -e

# Wait for mariadb
while (! mysqladmin ping --host=${DB_HOST} --port=3306 --user=${DB_USERNAME} --password=${DB_PASSWORD} --silent)
do
    echo "MariaDB dont accept connexion yet. Waiting..."
    sleep 5
done

echo 'Fix permissions'
chown -R www-data:www-data .
find . -type d -print0 | xargs -0 chmod 775
find . -type f -print0 | xargs -0 chmod 664

echo 'Migrate DB'
php artisan migrate --force

echo 'Optimise app'
php artisan optimize

echo 'Start FPM'
php-fpm -F
