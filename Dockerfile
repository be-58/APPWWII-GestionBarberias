# Dockerfile para Render con nginx-php-fpm
FROM richarvey/nginx-php-fpm:3.1.6

# Configurar directorio de trabajo
WORKDIR /var/www/html

# Copiar archivos de la aplicación
COPY . .

# Instalar dependencias PHP
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Configurar permisos
RUN chown -R nginx:nginx /var/www/html \
    && chmod -R 755 /var/www/html/storage \
    && chmod -R 755 /var/www/html/bootstrap/cache

# Configurar nginx
COPY nginx.conf /etc/nginx/sites-available/default.conf
RUN ln -sf /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default

# Copiar y hacer ejecutables los scripts
COPY deploy.sh /var/www/html/deploy.sh
COPY start-render.sh /var/www/html/start-render.sh
RUN chmod +x /var/www/html/deploy.sh /var/www/html/start-render.sh

# Exponer puerto 80 para Render
EXPOSE 80

# Comando de inicio
CMD ["/var/www/html/start-render.sh"]
