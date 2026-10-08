FROM php:8.4-apache
RUN apt-get update && apt-get install -y libpq-dev libonig-dev unzip git && docker-php-ext-install pdo_pgsql mbstring bcmath && a2enmod rewrite && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html
COPY . .
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data storage bootstrap/cache && chmod -R 775 storage bootstrap/cache
EXPOSE 80
CMD ["apache2-foreground"]
