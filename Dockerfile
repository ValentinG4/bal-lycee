FROM php:8.2-cli

# Installer les dépendances
RUN apt-get update && apt-get install -y unzip git zip libicu-dev libzip-dev libonig-dev libpq-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql intl zip opcache

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Créer le dossier de travail
WORKDIR /app

# Copier les fichiers Symfony dans l'image
COPY . .

# Installer les dépendances
RUN composer install --no-dev --optimize-autoloader && \
    php bin/console cache:clear --env=prod && \
    php bin/console cache:warmup --env=prod

# Lancer le serveur PHP Symfony
CMD ["php", "-S", "0.0.0.0:10000", "-t", "public"]
