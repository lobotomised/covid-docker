#!/bin/sh
set -e

# Wait for mariadb
while (! mysqladmin ping --host=${DB_HOST} --port=3306 --user=${DB_USERNAME} --password=${DB_PASSWORD} --silent)
do
    echo "MariaDB dont accept connexion yet. Waiting..."
    sleep 5
done

# Ensure we have vendor/ ready.
while [ ! -f /code/vendor/autoload.php ]
do
    echo "Volume is not ready. Waiting..."
    sleep 5
done

php artisan queue:work
