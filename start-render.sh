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

echo "Running all seeders..."
php artisan db:seed --force

echo "Running specific seeders to ensure they execute..."
php artisan db:seed --class=RoleSeeder --force
php artisan db:seed --class=UserSeeder --force

echo "Starting web server..."
exec /start.sh
