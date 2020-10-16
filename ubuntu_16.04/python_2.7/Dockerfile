FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    locales \
    tzdata

RUN locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN export LANG=en_US.UTF-8 && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    python2.7 \
    python-pip