# Covid Tracker

1) Clone the repository `git clone https://github.com/lobotomised/covid-docker .`
2) Copy the .env file `cp .env.example .env`
3) Generate an APP_KEY `sed -i -- 's/APP_KEY=insecure/APP_KEY='$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c32 ; echo '')'/g' .env`
4) Edit the `.env` file and set the `DB_PASSWORD`, `SENTRY_LARAVEL_DSN` and `APP_EMAIL`
4) Run `docker-compose up -d`
