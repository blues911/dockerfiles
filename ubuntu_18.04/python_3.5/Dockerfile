FROM ubuntu:18.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    locales \
    tzdata \
    wget

RUN locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libsqlite3-dev \
    libbz2-dev

RUN cd /tmp && \
    wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz && \
    tar -xf Python-3.5.0.tgz && \
    cd Python-3.5.0 && \
    ./configure --enable-optimizations && \
    make install

RUN ln -s /usr/local/bin/python3.5 /usr/bin/python && \
    ln -s /usr/local/bin/pip3.5 /usr/bin/pip

RUN pip install virtualenv
 
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*