FROM ubuntu:18.04

RUN groupadd -r mysql && \
    useradd -r -g mysql mysql

RUN apt-get update && \
    apt-get install -y \
    locales \
    tzdata \
    lsb-release \
    wget

RUN locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.11-1_all.deb -P /tmp/ && \
    echo '4' | dpkg -i /tmp/mysql-apt-config_0.8.11-1_all.deb

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated \
    mysql-server

RUN rm -rf /var/lib/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/var/lib/mysql"]

COPY ./entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["/usr/sbin/mysqld", "--user=mysql"]