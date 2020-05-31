FROM ubuntu:16.04

RUN groupadd -r mysql && \
    useradd -r -g mysql mysql

RUN apt-get update && \
    apt-get install -y \
    locales \
    tzdata \
    libaio1 \
    wget

RUN locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN cd /tmp && \
    wget https://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.56-linux-glibc2.5-x86_64.tar.gz && \
    tar -xvf mysql-5.5.56-linux-glibc2.5-x86_64.tar.gz && \
    mv mysql-5.5.56-linux-glibc2.5-x86_64 /opt && \
    rm -f mysql-5.5.56-linux-glibc2.5-x86_64.tar.gz && \
    cd /opt && \
    mv mysql-5.5.56-linux-glibc2.5-x86_64 mysql && \
    cd mysql && \
    chown -R mysql:mysql * && \
    cp support-files/my-medium.cnf /etc/my.cnf

RUN cd /tmp && \
    wget http://downloads.mysql.com/snapshots/pb/mysql-json-udfs-0.4.0/mysql-json-udfs-0.4.0-labs-json-udfs-linux-glibc2.5-x86_64.tar.gz && \
    tar -xzf mysql-json-udfs-0.4.0-labs-json-udfs-linux-glibc2.5-x86_64.tar.gz && \
    cp mysql-json-udfs-0.4.0-labs-json-udfs-linux-glibc2.5-x86_64/libmy_json_udf_path.so /opt/mysql/lib/plugin && \
    chown -R mysql:mysql /opt/mysql/lib/plugin && \
    rm -f mysql-json-udfs-0.4.0-labs-json-udfs-linux-glibc2.5-x86_64.tar.gz

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/opt/mysql/data"]

COPY ./entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["/opt/mysql/bin/mysqld", "--user=mysql", "--basedir=/opt/mysql"]