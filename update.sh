#!/bin/sh
set -e

git pull
docker-compose build --no-cache --pull
docker-compose down
docker volume rm covid_covid-code
docker-compose up -d --scale queue=3
