
FROM php:7.1-apache

ENV DEBIAN_FRONTEND noninteractive

#Install dependencies
RUN apt-get update \
  && apt-get install -y \
    apt-utils \
    libmcrypt-dev \
    git \
    zip \
    unzip \
  && apt-get autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archive/*.deb
  
# Install PHP extensions  
  RUN docker-php-ext-install pdo_mysql && \
      docker-php-ext-install mcrypt  && \
      docker-php-ext-install bcmath  && \
      docker-php-ext-install mbstring

# Install Composer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
&& rm -f /tmp/composer-setup.*

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Volumes
RUN mkdir -p /custom
VOLUME ["/var/www", "/custom"]

# Start
ADD ./run.sh /run.sh
RUN chmod 755 /*.sh
CMD ["/run.sh"]
