
FROM php:7.1-apache

#Install apt-utils, mcrypt & bcmath
RUN apt-get update && apt-get install -y \
    apt-utils \
    libmcrypt-dev \
    git \
    zip \
    unzip \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-install mcrypt \
  && docker-php-ext-install bcmath \
  && docker-php-ext-install mbstring

#Owerwrite the default vhost config
COPY ./etc/000-default.conf /etc/apache2/sites-available/

# Enable Apache mod_rewrite
RUN a2enmod rewrite

#Start web server
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
