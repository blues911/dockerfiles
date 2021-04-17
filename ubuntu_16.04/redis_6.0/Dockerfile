FROM ubuntu:16.04

ENV REDIS_VERSION 6.0.9

RUN groupadd -r redis && \
    useradd -r -g redis redis

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    tcl \
    wget

RUN cd /tmp && \
    wget http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz && \
    tar xzvf redis-$REDIS_VERSION.tar.gz && \
    cd redis-$REDIS_VERSION && \
    # make test && \
    make install && \
    mkdir -p /etc/redis && \
    mkdir -p /var/lib/redis && \
    cp redis.conf /etc/redis && \
    chown -R redis:redis /etc/redis && \
    chown -R redis:redis /var/lib/redis && \
    sed -i -e 's/dir .\//dir \/var\/lib\/redis/g' /etc/redis/redis.conf && \
    sed -i -e 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf && \
    sed -i -e 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

EXPOSE 6379

CMD ["/usr/local/bin/redis-server", "/etc/redis/redis.conf"]