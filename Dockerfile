# Image de base PHP avec extensions utiles
FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    unzip zip git curl libicu-dev libzip-dev libonig-dev libpq-dev libxml2-dev \
    && docker-php-ext-install intl pdo pdo_mysql zip opcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV APP_ENV=dev
ENV APP_DEBUG=1

WORKDIR /app

COPY . .

RUN composer install --optimize-autoloader
# RUN php bin/console importmap:install

# 👇 Commande Symfony pour importer le dump si présent

      # Tentative d'import avec attente
# RUN for i in 1 2 3 4 5; do \
#       php bin/console app:import-sql && break || (echo "Attente de la base... tentative $i"; sleep 5); \
#     done


   

CMD ["php", "-S", "0.0.0.0:10000", "-t", "public"]
