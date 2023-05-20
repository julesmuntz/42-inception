# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: julmuntz <julmuntz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/20 13:11:50 by julmuntz          #+#    #+#              #
#    Updated: 2023/05/20 13:58:48 by julmuntz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM \
alpine:3.17.3

RUN \
apk update && \
apk upgrade && \
apk add nginx && \
apk add openssl && \
mkdir -p /etc/nginx/ssl && \
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj \
"/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" && \
mkdir -p /var/run/nginx

COPY \
conf/nginx.conf /etc/nginx/nginx.conf

RUN \
chmod 755 /var/www/html && \
chown -R www-data:www-data /var/www/html

CMD \
[ "nginx", "-g", "daemon off;" ]
