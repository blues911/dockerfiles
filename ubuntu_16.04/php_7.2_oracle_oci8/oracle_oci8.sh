#!/bin/bash

# Setup instantclient
mkdir -p /opt/oracle
unzip /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip -d /opt/oracle
unzip /tmp/instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /opt/oracle
mv /opt/oracle/instantclient_12_1 /opt/oracle/instantclient
chown -R root:www-data /opt/oracle
ln -s /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so
ln -s /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so
echo /opt/oracle/instantclient > /etc/ld.so.conf.d/oracle-instantclient.conf

# Patch for pdo_oci
mkdir -p /opt/oracle/instantclient/lib
ln -s /opt/oracle/instantclient/*so* /opt/oracle/instantclient/lib
ln -s /opt/oracle/instantclient/sdk/include /opt/oracle/instantclient/include

# Download php dist
cd /tmp
wget https://www.php.net/distributions/php-7.2.31.tar.gz
tar -xzvf php-7.2.31.tar.gz

# Install oci8
cd /tmp/php-7.2.31/ext/oci8
phpize
./configure --with-oci8=shared,instantclient,/opt/oracle/instantclient/
make install
echo "extension=oci8.so" > /etc/php/7.2/mods-available/oci8.ini
ln -s /etc/php/7.2/mods-available/oci8.ini /etc/php/7.2/fpm/conf.d/20-oci8.ini
ln -s /etc/php/7.2/mods-available/oci8.ini /etc/php/7.2/cli/conf.d/20-oci8.ini

# Install pdo_oci
cd /tmp/php-7.2.31/ext/pdo_oci
phpize
./configure --with-pdo-oci=/opt/oracle/instantclient
make install
echo "extension=pdo_oci.so" > /etc/php/7.2/mods-available/pdo_oci.ini
ln -s /etc/php/7.2/mods-available/pdo_oci.ini /etc/php/7.2/fpm/conf.d/20-pdo_oci.ini
ln -s /etc/php/7.2/mods-available/pdo_oci.ini /etc/php/7.2/cli/conf.d/20-pdo_oci.ini

# Add environement variables
echo "LD_LIBRARY_PATH=\"/opt/oracle/instantclient\"" >> /etc/environment
echo "ORACLE_HOME=\"/opt/oracle/instantclient\"" >> /etc/environment

# Remove files:
# /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip
# /tmp/instantclient-sdk-linux.x64-12.1.0.2.0.zip
# /tmp/php-7.2.31.tar.gz
# /tmp/php-7.2.31
rm -rf /tmp/*