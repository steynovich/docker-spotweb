<?php
$dbsettings['engine'] = 'mysql';
$dbsettings['host'] = getenv('MYSQL_PORT_3306_TCP_ADDR');
$dbsettings['dbname'] = getenv('MYSQL_ENV_MYSQL_DATABASE');
$dbsettings['user'] = getenv('MYSQL_ENV_MYSQL_USER');
$dbsettings['pass'] = getenv('MYSQL_ENV_MYSQL_PASSWORD');
?>
