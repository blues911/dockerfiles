FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y redis-server

RUN sed -i '/bind 127.0.0.1 ::1/s/^/#/g' /etc/redis/redis.conf

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/redis"]

EXPOSE 6379

CMD ["/usr/bin/redis-server", "--daemonize", "yes"]