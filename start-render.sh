#!/usr/bin/env bash

# Script que se ejecuta al iniciar el contenedor en Render
echo "Starting Laravel application..."

# Optimizaciones de Laravel
echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Optimizing autoloader..."
composer dump-autoload --optimize

echo "Running migrations..."
php artisan migrate --force

echo "Seeding database..."
php artisan db:seed --force

echo "Starting web server..."
exec /start.sh
