# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: julmuntz <julmuntz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/20 16:17:15 by julmuntz          #+#    #+#              #
#    Updated: 2023/05/21 14:03:04 by julmuntz         ###   ########.fr        #
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

RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz

RUN \
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

RUN \
mkdir -p /var/www/html && \
chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY conf/auto_config.sh /var/www/auto_config.sh
RUN chmod +x /var/www/auto_config.sh
RUN mkdir -p /run/php

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT \
[ "bash", "/var/www/auto_config.sh" ]