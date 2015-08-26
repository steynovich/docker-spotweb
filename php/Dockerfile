FROM php:fpm
MAINTAINER github@steynhuizinga.nl

# Install git
RUN apt-get update -q 
RUN apt-get install -q -y git

# Install PDO extentions
RUN apt-get install -q -y libgd-dev libgmp3-dev libfreetype6-dev libjpeg-dev libpq-dev libpng12-dev
RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
       docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring gd zip gettext gmp bcmath

# Deploy Spotweb
RUN git clone -q https://github.com/spotweb/spotweb.git /var/www/html/spotweb

# Configure PHP
ADD files/spotweb.ini /usr/local/etc/php/conf.d/

# Configure Spotweb
ADD files/dbsettings.inc.php /var/www/html/spotweb/
RUN mkdir -m777 /var/www/html/spotweb/cache

# Install cron
RUN apt-get install -y -q cron
ADD files/cron.cfg /root/
ADD files/cron_env.sh /root/
RUN crontab /root/cron.cfg

# Install MySQL client for db creation
RUN apt-get install -y mariadb-client
ADD files/create_db.sh /root/

# Install supervisord
RUN apt-get install -y -q supervisor
RUN mkdir -p /var/log/supervisor
ADD files/supervisord.conf /etc/supervisor/conf.d/

# Finally run everything from supervisord
CMD ["/usr/bin/supervisord"]
