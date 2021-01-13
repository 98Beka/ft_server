FROM  debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget default-mysql-server nginx 
RUN apt-get -y install php7.3-fpm php7.3-mysql
RUN apt-get -y install mariadb-server
RUN apt-get -y install vim


#nginx
RUN rm /etc/nginx/sites-available/default
COPY srcs/nginx.conf /etc/nginx/sites-available/default

# Install WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /var/www/html/

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 777 /var/www/*

#Install PHPMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.4-english.tar.gz
RUN rm phpMyAdmin-5.0.4-english.tar.gz
RUN mv phpMyAdmin-5.0.4-english/ /var/www/html/phpmyadmin

COPY srcs/wp-config.php /var/www/html/wordpress/wp-config.php
#COPY srcs/phpmyadmin.inc.php /phpmyadmin.inc.php

RUN mkdir 123
COPY ./srcs/start.sh ./123/start.sh
RUN chmod 777 ./123/start.sh

EXPOSE 80 443

CMD /123/start.sh