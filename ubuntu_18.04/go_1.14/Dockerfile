FROM ubuntu:18.04

ENV PATH=$PATH:/opt/go/bin

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    wget \
    git

RUN wget -P /tmp https://golang.org/dl/go1.14.6.linux-amd64.tar.gz && \
    tar -C /opt -xzf /tmp/go1.14.6.linux-amd64.tar.gz

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*