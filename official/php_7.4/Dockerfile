FROM php:7.4-fpm

WORKDIR /var/www/

ENV PHPREDIS_VERSION 5.3.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libzip-dev \
    # php ext
    && pecl install redis-$PHPREDIS_VERSION \
    && docker-php-ext-install \
       zip \
       exif \
       pcntl \
       bcmath \
       pdo \
       pdo_mysql \
    && docker-php-ext-enable redis \
    # composer
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer \
    # clear
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
