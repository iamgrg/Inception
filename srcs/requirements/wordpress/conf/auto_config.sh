#!/bin/bash

# Attendre que MariaDB soit prête
sleep 10

# Vérifier si le fichier wp-config.php existe
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    # Configurer la base de données WordPress en utilisant le CLI de WordPress
    wp config create --allow-root \
                     --dbname=$SQL_DATABASE \
                     --dbuser=$SQL_USER \
                     --dbpass=$SQL_PASSWORD \
                     --dbhost=mariadb:3306 \
                     --path='/var/www/wordpress'

    # Installer WordPress
    wp core install --allow-root \
                    --url="votre_url" \
                    --title="Votre titre de site" \
                    --admin_user="votre_admin_username" \
                    --admin_password="votre_admin_password" \
                    --admin_email="votre_email" \
                    --path='/var/www/wordpress'
    
    # Créer un autre utilisateur (si nécessaire)
    # wp user create --allow-root <username> <email> --role=<role> --user_pass=<password> --path='/var/www/wordpress'
fi

# Créer le dossier /run/php si nécessaire
if [ ! -d "/run/php" ]; then
    mkdir -p /run/php
fi

# Lancer php-fpm
/usr/sbin/php-fpm7.3 -F
