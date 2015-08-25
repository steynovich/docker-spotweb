#!/bin/bash

MYSQL="mysql -h${MYSQL_PORT_3306_TCP_ADDR} -u${MYSQL_ENV_MYSQL_USER} -p${MYSQL_ENV_MYSQL_PASSWORD} ${MYSQL_ENV_MYSQL_DATABASE} -s"

while [ 1 ]; do
  echo "Check if db is online ..."
  echo "select 1" | $MYSQL > /dev/null 2>&1 && break
  echo "Retrying ..."
  sleep 1
done

  # Check if tables exists and create them if not
echo "select count(*) from settings" | $MYSQL > /dev/null 2>&1
retval=$?
if [ $retval == 1 ]; then
   echo "Run upgrade-db.php twice.. Why? Dunno. Bug in Spotweb ..."
   /usr/local/bin/php /var/www/html/spotweb/upgrade-db.php
   /usr/local/bin/php /var/www/html/spotweb/upgrade-db.php --reset-password admin

   echo "update settings set value = 'http://jijhaatmij.hopto.me/blacklist.txt' where name = 'blacklist_url'" | $MYSQL
   echo "update settings set value = 'http://jijhaatmij.hopto.me/whitelist.txt' where name = 'whitelist_url'" | $MYSQL
   echo "update settings set value = 1 where name = 'external_blacklist' or name = 'external_whitelist'" | $MYSQL
fi

exit 0
