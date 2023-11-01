#!/bin/bash

# Création du répertoire pour le socket mysqld si nécessaire
#mkdir -p /run/mysqld/
#chown mysql:mysql /run/mysqld/

# Démarrage de MySQL
service mysql start;

# Création de la base de données
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Création d'un utilisateur pour la base de données
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Octroi de tous les droits à l'utilisateur pour la base de données
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Modification des droits de l'utilisateur root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Rafraîchissement des privilèges
mysql -e "FLUSH PRIVILEGES;"

# Arrêt de MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Démarrage de MySQL avec mysqld_safe
exec mysqld_safe
