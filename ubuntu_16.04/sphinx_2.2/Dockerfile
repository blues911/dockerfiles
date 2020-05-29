FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:builds/sphinxsearch-rel22 && \
    apt-get update && \
    apt-get install -y sphinxsearch

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/sphinxsearch/sphinx.conf

VOLUME ["/var/lib/sphinxsearch/data"]

COPY ./start.sh /root/start.sh
RUN chmod +x /root/start.sh

EXPOSE 9312 9306

CMD ["/root/start.sh"]