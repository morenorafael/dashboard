#!/bin/sh
set -e

echo "Starting queue worker..."
php artisan queue:work --sleep=3 --tries=3 --max-time=3600 --queue=default
