
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

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Bespoken custom installation
RUN sh custom_install.php

#Start web server
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
