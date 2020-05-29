#!/bin/bash

set -e

MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-"password"}

# /var/lib/mysql
if [ ! -d /var/lib/mysql/mysql ]; then

    echo "[0] initialize databases"
    /usr/sbin/mysqld --initialize --user=mysql >/dev/null 2>&1

    echo "[1] start mysqld_safe"
    /usr/bin/mysqld_safe --skip-grant-tables --user=mysql >/dev/null 2>&1 &

    timeout=15
    while ! /usr/bin/mysqladmin --user=root status >/dev/null 2>&1
    do
        timeout=$(($timeout - 1))
        if [ $timeout -eq 0 ]; then
            echo -e "\nerror: connect to mysql server failed."
            exit 1
        fi
        sleep 1
    done

    echo "[2] reset root password"
    mysql --user=root --execute="UPDATE mysql.user SET authentication_string=null WHERE User='root'; FLUSH PRIVILEGES;" >/dev/null

    # change root password
    # mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';

    # add root remote access
    # mysql> CREATE USER 'root'@'%' IDENTIFIED BY 'password';
    # mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

    echo "[3] stop mysqld_safe mode and start mysqld"
    killall mysqld
    sleep 10
fi

exec "$@"