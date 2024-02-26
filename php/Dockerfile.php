# Utilisation de PHP 8.2 FPM
FROM php:8.2-fpm

# Installation des dépendances système et des extensions PHP
RUN apt-get update && \
    apt-get install -y unzip libzip-dev && \
    docker-php-ext-install zip mysqli && \
    docker-php-ext-enable zip mysqli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Ajout d'un utilisateur non root
RUN useradd -d /usr/share/nginx/ -s /bin/bash dev-user

# Installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copie du composer.json et installation des dépendances
COPY composer.json .
RUN composer install --no-scripts --no-autoloader

# Copie du reste du code source
COPY . .

# Ajustement des permissions si nécessaire
RUN chown -R dev-user:dev-user /var/www/html

# Génération de l'autoloader de Composer avec les scripts de post-installation
RUN composer dump-autoload --optimize

# Utilisation de l'utilisateur non root pour exécuter les commandes suivantes et le daemon PHP-FPM
USER dev-user
