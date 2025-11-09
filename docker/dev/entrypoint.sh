#!/bin/sh
set -e

composer install

php artisan octane:install --server=roadrunner --no-interaction

php artisan octane:start --host=0.0.0.0 --port=8000
