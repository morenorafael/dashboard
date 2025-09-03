FROM midaria/php:latest

# Instalar dependencias del sistema
RUN apk add --no-cache \
    autoconf \
    bash \
    dcron \
    g++ \
    make \
    libpq \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    icu-dev \
    postgresql-dev \
    redis \
    linux-headers

# Instalar extensión de Redis
RUN pecl install redis \
    && docker-php-ext-enable redis

# Extensiones necesarias
RUN docker-php-ext-install pdo_pgsql pgsql sockets pcntl posix fileinfo

# COPY PHP config
COPY docker/config /usr/local/etc/

# Crear directorio de trabajo
WORKDIR /var/www

# Copiar archivos del backend (sin node_modules ni dist aún)
COPY . .

# Instalar dependencias de Composer
RUN composer install --no-dev --optimize-autoloader

# Scripts
COPY docker/service.sh /var/www/service.sh
RUN chmod +x /var/www/service.sh

COPY docker/worker.sh /var/www/worker.sh
RUN chmod +x /var/www/worker.sh

# Instalar Octane con RoadRunner
RUN php artisan octane:install --server=roadrunner --no-interaction

# Permisos
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Cron
COPY docker/cronjob /etc/crontabs/root
RUN touch /var/www/storage/logs/cron.log
