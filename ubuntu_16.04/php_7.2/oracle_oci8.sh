#!/bin/bash

# https://serverfault.com/questions/911475/howto-install-oracle-oci8-instantclient-on-ubuntu-18-04

# setup instantclient
mkdir -p /opt/oracle
unzip /tmp/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /opt/oracle
unzip /tmp/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /opt/oracle
mv /opt/oracle/instantclient_12_2 /opt/oracle/instantclient
chown -R root:www-data /opt/oracle
ln -s /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so
ln -s /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so
echo /opt/oracle/instantclient > /etc/ld.so.conf.d/oracle-instantclient.conf
ldconfig

# install oci8
echo 'instantclient,/opt/oracle/instantclient' | pecl install oci8
echo "extension=oci8.so" >> /etc/php/7.2/cli/php.ini
echo "extension=oci8.so" >> /etc/php/7.2/fpm/php.ini

# add environement variables
echo "LD_LIBRARY_PATH=\"/opt/oracle/instantclient\"" >> /etc/environment
echo "ORACLE_HOME=\"/opt/oracle/instantclient\"" >> /etc/environment

# remove zip files
rm -rf /tmp/*.zip