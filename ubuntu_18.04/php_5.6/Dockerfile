FROM ubuntu:18.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    software-properties-common \
    locales \
    tzdata \
    curl

RUN locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN export LANG=en_US.UTF-8 && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
    apt-get install -y \
    php5.6-fpm \
    php5.6-cli

RUN apt-get install -y \
    php5.6-dev \
    php5.6-mcrypt \
    php5.6-mbstring \
    php5.6-bcmath \
    php5.6-curl \
    php5.6-dev \
    php5.6-zip \
    php5.6-xml \
    php5.6-mysql \
    php5.6-pgsql \
    php5.6-sqlite3 \
    php5.6-gd \
    php5.6-imagick \
    php5.6-intl

RUN mkdir /run/php && \
    sed -i '/listen = \/run\/php\/php5.6-fpm.sock/s/^/;/g' /etc/php/5.6/fpm/pool.d/www.conf && \
    sed -i '/;listen = \/run\/php\/php5.6-fpm.sock/a listen = 0.0.0.0:9000\n' /etc/php/5.6/fpm/pool.d/www.conf

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9000

CMD ["/usr/sbin/php-fpm5.6", "-F"]