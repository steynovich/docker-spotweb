# Intro

Multi-container setup to run Spotweb. It uses MariaDB, PHP-FPM and nginx.

## First run

To build the containers:
	contrib/build.sh
	
To initially run the containers:
	contrib/run.sh

Database credentials as used in the MariaDB containers are also passed to the container running PHP. When launching it will automatically create the database structure if needed (e.g. on the first run).

Default username is 'admin' and the default password is 'spotweb'. Please change it directly after booting up the containers.

Now point your browser to the host running the nginx container: http://192.168.31.23/. You will be automatically redirected to http://192.168.31.23/spotweb/.
After logging in spotweb needs to be configured to use a Usenet server and to handle NZBs properly. More information on this can be found on the spotweb github (https://github.com/spotweb/spotweb/wiki).

## Stopping the containers

To stop the spotweb containers run:
	docker stop spotweb{nginx,php,db}

## Starting the containers

To start the spotweb containers run:
	docker start spotweb{db,php,nginx}

## Cron

New spots are downloaded every hour using the '@hourly' timestamp in cron. Running the cronjob for the first time will take a while. The time and storage required to store all the posts can be limited by disabling the retrieval of spot comments in the settings area.

## Terminating the containers

If you - for some reason - want to delete the containers run:
	docker stop spotweb{nginx,php,db}
	docker rm spotweb{nginx,php,db}

Afterwards (intermediate containers) can be deleted.

## Contrib

In the directory/ example scripts can be found. 
