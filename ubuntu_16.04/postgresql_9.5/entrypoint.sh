#!/bin/bash

if [ ! -d "/var/lib/postgresql/9.5/data/base" ]; then
    echo "[0] initialize databases"
    mkdir -p /var/lib/postgresql/9.5/data
    chown -R postgres:postgres /var/lib/postgresql/9.5/data
    su - postgres -c "/usr/lib/postgresql/9.5/bin/initdb --pgdata=/var/lib/postgresql/9.5/data"
fi

# change postgres password
# su postgres -c "psql -c \"ALTER USER postgres WITH PASSWORD 'postgres';\""

su - postgres -c "/usr/lib/postgresql/9.5/bin/postgres -c config_file=/etc/postgresql/9.5/main/postgresql.conf"