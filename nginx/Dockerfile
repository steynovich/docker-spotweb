FROM nginx
MAINTAINER github@steynhuizinga.nl

RUN rm /etc/nginx/conf.d/default.conf
ADD files/spotweb.conf /etc/nginx/conf.d/

RUN apt-get update -q
RUN apt-get install -y git

RUN mkdir -p /var/www/html
RUN git clone -q https://github.com/spotweb/spotweb.git /var/www/html/spotweb

EXPOSE 80
