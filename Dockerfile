FROM php:7.2-apache


RUN apt update -y && apt upgrade -y
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli


EXPOSE 8080
EXPOSE 80

WORKDIR /var/www/html
COPY . ./

# change owner of all files so apache can write to it
RUN chown -R www-data *


# update apache port config (because TestLink needs to use 8080)
RUN cat ./apache/ports.conf > /etc/apache2/ports.conf

# create required folders and change owner
RUN mkdir -p /var/testlink/logs/ mkdir -p /var/testlink/upload_area/ && chown -R www-data /var/testlink/