#!/usr/bin/env bash
echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Optimizing autoloader..."
composer dump-autoload --optimize

echo "Deploy script completed"
