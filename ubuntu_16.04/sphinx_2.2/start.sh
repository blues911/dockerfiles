#!/bin/bash

DATA_DIR='/var/lib/sphinxsearch/data/'

if [ ! "$(ls -A $DATA_DIR)" ]; then
    /usr/bin/indexer --rotate --all
fi

/usr/bin/searchd --nodetach --config /etc/sphinxsearch/sphinx.conf