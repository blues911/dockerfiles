#!/bin/bash

# apache: 2.4
docker build -t apache:2.4 ./apache_2.4/

# go: 1.14
docker build -t go:1.14 ./go_1.14/

# mysql: 5.5, 5.5-json-udfs, 5.7, 8.0
docker build -t mysql:5.5 ./mysql_5.5/
docker build -t mysql:5.5-json-udfs ./mysql_5.5_json_udfs/
docker build -t mysql:5.7 ./mysql_5.7/
docker build -t mysql:8.0 ./mysql_8.0/

# nginx: 1.10
docker build -t nginx:1.10 ./nginx_1.10/

# node: 10.x
docker build -t node:10.x ./node_10.x/

# php: 5.6, 7.0, 7.0-oracle-oci8, 7.1, 7.2, 7.4, 8.0
docker build -t php:5.6 ./php_5.6/
docker build -t php:7.0 ./php_7.0/
docker build -t php:7.0-oracle-oci8 ./php_7.0_oracle_oci8/
docker build -t php:7.1 ./php_7.1/
docker build -t php:7.2 ./php_7.2/
docker build -t php:7.4 ./php_7.4/
docker build -t php:8.0 ./php_8.0/

# python: 3.5
docker build -t python:3.5 ./python_3.5/

# postgresql: 9.5
docker build -t postgresql:9.5 ./postgresql_9.5/

# redis: 5.0, 6.0
docker build -t redis:5.0 ./redis_5.0/
docker build -t redis:6.0 ./redis_6.0/

# sphinx: 2.2
docker build -t sphinx:2.2 ./sphinx_2.2/
