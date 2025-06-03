# Image de base PHP avec extensions utiles
FROM php:8.2-cli

# Installer dépendances système
RUN apt-get update && apt-get install -y \
    unzip zip git curl libicu-dev libzip-dev libonig-dev libpq-dev libxml2-dev \
    && docker-php-ext-install intl pdo pdo_mysql zip opcache

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Autoriser l'exécution en tant que root (Render)
ENV COMPOSER_ALLOW_SUPERUSER=1

# Définir Symfony en mode dev
ENV APP_ENV=dev
ENV APP_DEBUG=1

# Définir le répertoire de travail
WORKDIR /app

# Copier le projet Symfony dans le conteneur
COPY . .

# Installer les dépendances PHP avec les dev-deps
RUN composer install --optimize-autoloader

# Lancer le serveur PHP intégré Symfony
CMD ["php", "-S", "0.0.0.0:10000", "-t", "public"]
