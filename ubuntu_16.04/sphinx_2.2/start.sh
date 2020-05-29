#!/bin/bash

if [ ! "$(ls -A /var/lib/sphinxsearch/data/)" ]; then
    /usr/bin/indexer --rotate --all
fi

/usr/bin/searchd --nodetach --config /etc/sphinxsearch/sphinx.conf