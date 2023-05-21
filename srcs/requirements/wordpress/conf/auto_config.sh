#!/bin/bash

if [ -f ./wp-config.php ]
then
    echo "Wordpress already installed, skipping download and configuration."
else
    wp core download --allow-root \
    && wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOSTNAME --allow-root \
    && wp core install --url=https://localhost --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root \
    && wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --porcelain --allow-root
fi

/usr/sbin/php-fpm7.3 -F -R

# sleep 10
# if [ ! -e /var/www/wordpress/wp-config.php ]; then
# # wp-config.php file
#     wp config create	--allow-root \
#     					--dbname=$SQL_DATABASE \
#     					--dbuser=$SQL_USER \
#     					--dbpass=$SQL_PASSWORD \
#     					--dbhost=mariadb:3306 --path='/var/www/wordpress'
#     sleep 2
# fi

# if [ ! -d /run/php ]; then
#     mkdir ./run/php
# fi
# /usr/sbin/php-fpm7.3 -F