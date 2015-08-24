#!/bin/bash

echo "Starting MariaDB ..."
docker run --name spotwebdb -e MYSQL_ROOT_PASSWORD=rootpw -e MYSQL_USER=spotweb -e MYSQL_PASSWORD=spotweb -e MYSQL_DATABASE=spotweb -d mariadb
echo "Starting PHP-FPM ..."
docker run --name spotwebphp --link spotwebdb:mysql -d spotwebphp
echo "Starting nginx ..."
docker run --name spotwebnginx --link spotwebphp:fpm -p 80:80 -d spotwebnginx
