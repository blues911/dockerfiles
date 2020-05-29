FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash  && \
    apt-get install -y nodejs

RUN node -v && npm -v

COPY ./server.js /srv/node/server.js
RUN chmod +x /srv/node/server.js

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 5000

CMD ["/usr/bin/node", "/srv/node/server.js"]