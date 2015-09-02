#!/bin/bash

docker pull mariadb && \
docker build -t steynovich/spotweb-php php/ && \
docker build -t steynovich/spotweb-nginx nginx/
