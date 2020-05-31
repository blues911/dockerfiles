#! /bin/bash
# ------------------------------------------------------------------------------
# images based on ubuntu:16.04
# ------------------------------------------------------------------------------
# apache: 2.4
docker build -t apache:2.4 ./apache_2.4/
# nginx: 1.14
docker build -t nginx:1.14 ./nginx_1.14/
# node: 10.x
docker build -t node:10.x ./node_10.x/
# php: 5.6, 7.2, 7.4
docker build -t php:5.6 ./php_5.6/
docker build -t php:7.2 ./php_7.2/
docker build -t php:7.2-oracle-oci8 ./php_7.2_oracle_oci8/
docker build -t php:7.4 ./php_7.4/
# mysql: 5.5, 5.7, 8.0
docker build -t mysql:5.5 ./mysql_5.5/
docker build -t mysql:5.5-json-udfs ./mysql_5.5_json_udfs/
docker build -t mysql:5.7 ./mysql_5.7/
docker build -t mysql:8.0 ./mysql_8.0/
# sphinx: 2.2
docker build -t sphinx:2.2 ./sphinx_2.2/
# redis: 4.0
docker build -t redis:4.0 ./redis_4.0/
# TODO: postgresql