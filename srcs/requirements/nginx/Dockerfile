# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: julmuntz <julmuntz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/20 13:11:50 by julmuntz          #+#    #+#              #
#    Updated: 2023/05/21 12:55:54 by julmuntz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM \
debian:buster

RUN \
apt-get update && \
apt-get upgrade -y && \
apt-get install -y nginx && \
apt-get install -y openssl && \
mkdir -p /etc/nginx/ssl && \
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj \
"/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=julmuntz.42.fr/UID=julmuntz" && \
mkdir -p /run/nginx

COPY \
conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN \
chmod 755 /var/www/html && \
chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD \
[ "nginx", "-g", "daemon off;" ]
