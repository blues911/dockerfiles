#!/bin/bash

set -e

MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-"password"}

# /opt/mysql/data
if [ ! -d /opt/mysql/data/mysql ]; then

    echo "initialize databases"
    /opt/mysql/scripts/mysql_install_db --user=mysql --basedir=/opt/mysql --datadir=/opt/mysql/data/ >/dev/null 2>&1

    echo "start mysqld_safe"
    /opt/mysql/bin/mysqld_safe --user=mysql >/dev/null 2>&1 &

    timeout=15
    while ! /opt/mysql/bin/mysqladmin -u root status >/dev/null 2>&1
    do
        timeout=$(($timeout - 1))
        if [ $timeout -eq 0 ]; then
            echo -e "\nerror: connect to mysql server failed."
            exit 1
        fi
        sleep 1
    done

    echo "update root password"
    /opt/mysql/bin/mysql --user=root --execute="UPDATE mysql.user SET password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE user='root'; FLUSH PRIVILEGES;"
    /opt/mysql/bin/mysql --user=root --password=$MYSQL_ROOT_PASSWORD --execute="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

    echo "stop mysqld_safe mode and start mysqld"
    /opt/mysql/bin/mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown
    sleep 5
fi

exec "$@"