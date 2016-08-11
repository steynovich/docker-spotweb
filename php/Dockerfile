FROM php:7.0.9-fpm-alpine
MAINTAINER github@steynhuizinga.nl

# Install packages
RUN apk add --update git gd gmp-dev gettext-dev freetype-dev libpng-dev libjpeg-turbo-dev mariadb-client supervisor postgresql-dev && rm -rf /var/cache/apk/*
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
       docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring gd zip gettext gmp bcmath opcache

# Deploy Spotweb
RUN mkdir -p /var/www/html/spotweb && git clone -q https://github.com/spotweb/spotweb.git /var/www/html/spotweb

# Configure PHP
COPY files/spotweb.ini files/opcache.ini /usr/local/etc/php/conf.d/

# Configure Spotweb
COPY files/dbsettings.inc.php /var/www/html/spotweb/
RUN mkdir -m777 /var/www/html/spotweb/cache

# Install cron
COPY files/cron.cfg /root/
COPY files/cron_env.sh /root/
RUN crontab /root/cron.cfg

# Install MySQL client for db creation
COPY files/create_db.sh /root/

# Install supervisord
COPY files/supervisord.conf /etc/supervisord.conf

# Finally run everything from supervisord
CMD ["/usr/bin/supervisord"]
