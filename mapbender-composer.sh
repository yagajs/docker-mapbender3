#!/bin/bash

cd /srv/www/mapbender
exec su -s /bin/bash www-data -c "composer $@"
