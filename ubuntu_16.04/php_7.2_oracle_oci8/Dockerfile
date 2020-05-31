FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    locales \
    tzdata \
    curl \
    wget \
    zip

RUN locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN export LANG=en_US.UTF-8 && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
    apt-get install -y \
    libaio1 \
    php7.2-fpm \
    php7.2-cli

RUN apt-get install -y \
    php7.2-dev \
    php7.2-mbstring \
    php7.2-bcmath \
    php7.2-tokenizer \
    php7.2-ctype \
    php7.2-json \
    php7.2-curl \
    php7.2-zip \
    php7.2-xml \
    php7.2-mysql \
    php7.2-pgsql \
    php7.2-sqlite3 \
    php7.2-gd \
    php7.2-imagick \
    php7.2-intl

RUN mkdir /run/php && \
    sed -i '/listen = \/run\/php\/php7.2-fpm.sock/s/^/;/g' /etc/php/7.2/fpm/pool.d/www.conf && \
    sed -i '/;listen = \/run\/php\/php7.2-fpm.sock/a listen = 0.0.0.0:9000\n' /etc/php/7.2/fpm/pool.d/www.conf

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer

COPY ./instantclient-basic-linux.x64-12.1.0.2.0.zip /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip
COPY ./instantclient-sdk-linux.x64-12.1.0.2.0.zip /tmp/instantclient-sdk-linux.x64-12.1.0.2.0.zip
COPY ./oracle_oci8.sh /root/oracle_oci8.sh

RUN chmod +x /root/oracle_oci8.sh && \
    /bin/bash /root/oracle_oci8.sh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.2", "-F"]