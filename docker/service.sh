#!/bin/sh
set -e

crond -l 2 -f &

echo "Running migrations..."
php artisan migrate --force

echo "Optimizing Laravel..."
php artisan optimize

echo "Starting Octane (RoadRunner)..."
php artisan octane:start --host=0.0.0.0 --port=8001 --rr-config=.rr.yaml
