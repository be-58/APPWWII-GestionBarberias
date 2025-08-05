#!/usr/bin/env bash

# Script que se ejecuta al iniciar el contenedor en Render
echo "Starting Laravel application..."

echo "Running migrations..."
php artisan migrate --force

echo "Seeding database..."
php artisan db:seed --force

echo "Starting web server..."
exec /start.sh
