FROM nginx:1.10.0-alpine
MAINTAINER github@steynhuizinga.nl

RUN rm /etc/nginx/conf.d/default.conf
ADD files/spotweb.conf /etc/nginx/conf.d/

# Install spotweb
RUN apk add --update git && rm -rf /var/cache/apk/*
RUN mkdir -p /var/www/html && git clone -q https://github.com/spotweb/spotweb.git /var/www/html/spotweb
