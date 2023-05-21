# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: julmuntz <julmuntz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/20 14:03:43 by julmuntz          #+#    #+#              #
#    Updated: 2023/05/21 12:39:32 by julmuntz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM \
debian:buster

RUN \
apt-get update && \
apt-get upgrade -y && \
apt-get install -y mariadb-server

COPY \
conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY \
conf/mysql-setup.sh /mysql-setup.sh

RUN \
chmod +x /mysql-setup.sh

EXPOSE \
3306

CMD ["sh", "mysql-setup.sh"]
