FROM ubuntu:16.04

RUN groupadd -r postgres && \
    useradd -r -g postgres postgres

RUN apt-get update && \
    apt-get install -y \
    locales \
    tzdata \
    lsb-release \
    wget

RUN locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q postgresql-9.5 postgresql-contrib-9.5

RUN echo 'host all all all md5' >> /etc/postgresql/9.5/main/pg_hba.conf

VOLUME ["/var/lib/postgresql/data"]

COPY ./entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 5432

ENTRYPOINT ["/sbin/entrypoint.sh"]