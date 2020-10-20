FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y nginx

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]