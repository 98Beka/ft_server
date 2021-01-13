#!/bin/bash


# SSL
mkdir /etc/nginx/ssl
chmod -R 777 /etc/nginx/*
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/certificate.key -out /etc/nginx/ssl/certificate.crt -subj "/C=RF/ST=KZ/L=KZ/O=21 School/OU=ehande/CN=good_site"
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt -subj '/CN=localhost'

#openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/certificate.key -keyout /etc/nginx/ssl/certificate.crt -subj "CN=localhost"


service mysql start


echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql
echo "GRANT ALL ON wordpress.* TO 'bek'@'localhost' IDENTIFIED BY '123';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "quit;"

service php7.3-fpm start
service nginx start



bash