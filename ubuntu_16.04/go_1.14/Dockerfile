FROM ubuntu:16.04

ENV PATH=$PATH:/usr/local/go/bin

RUN apt-get update && \
    apt-get install -y \
    wget

RUN wget -P /tmp https://golang.org/dl/go1.14.6.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf /tmp/go1.14.6.linux-amd64.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*