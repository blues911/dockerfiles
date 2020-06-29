#!/bin/bash

if [ ! -d /var/lib/postgresql/data/base ]; then
    echo "[0] initialize databases"
    mkdir -p /var/lib/postgresql/data
    chown -R postgres:postgres /var/lib/postgresql/data
    su - postgres -c '/usr/lib/postgresql/9.5/bin/initdb --pgdata=/var/lib/postgresql/data'
fi

su - postgres -c '/usr/lib/postgresql/9.5/bin/postgres -D /var/lib/postgresql/data'