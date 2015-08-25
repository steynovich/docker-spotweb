#!/bin/bash

docker pull mariadb && \
docker build -t spotwebphp php/ && \
docker build -t spotwebnginx nginx/
