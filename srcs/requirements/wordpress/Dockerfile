# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: julmuntz <julmuntz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/20 16:17:15 by julmuntz          #+#    #+#              #
#    Updated: 2023/05/23 16:41:33 by julmuntz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM \
debian:buster

RUN \
apt-get update && \
apt-get upgrade -y && \
apt-get install -y wget php7.3 php-fpm php-mysql mariadb-client sendmail

COPY \
conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN \
wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www && \
cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz

RUN \
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

RUN \
mkdir -p /var/www/wordpress && \
chown -R www-data:www-data /var/www/wordpress && \
chmod -R 755 /var/www/wordpress

COPY \
conf/config-setup.sh /var/www/config-setup.sh

RUN \
chmod +x /var/www/config-setup.sh && \
mkdir -p /run/php

WORKDIR \
/var/www/wordpress

EXPOSE \
9000

ENTRYPOINT \
["bash", "/var/www/config-setup.sh"]
