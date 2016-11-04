# Intro

Multi-container setup to run Spotweb. It uses a MariaDB container and a combined PHP-FPM and nginx container.

## First run

(Optionally) To build the containers yourself:
```bash
$ docker build --rm -t steynovich/spotweb:latest .
```

To initially run the containers:
```bash
$ docker-compose up
```

Database credentials as used in the MariaDB containers are also passed to the container running PHP. When launching it will automatically create the database structure if needed (e.g. on the first run).

Default username is 'admin' and the default password is 'spotweb'. Please change it directly after booting up the containers.

Now point your browser to the host running the nginx container: http://192.168.31.23/. You will be automatically redirected to http://192.168.31.23/spotweb/.
After logging in spotweb needs to be configured to use a Usenet server and to handle NZBs properly. More information on this can be found on the spotweb github (https://github.com/spotweb/spotweb/wiki).

## Stopping the containers

To stop the spotweb containers run:
```bash
$ docker-compose stop
```

## Starting the containers

To start the spotweb containers run:
```bash
$ docker-compose start
```

## Cron

New spots are downloaded every hour using the '@hourly' timestamp in cron. Running the cronjob for the first time will take a while. The time and storage required to store all the posts can be limited by disabling the retrieval of spot comments in the settings area.

## Terminating the containers

If you - for some reason - want to delete the containers run:
```bash
$ docker-compose down
```

Afterwards (intermediate containers) can be deleted.

## Deleting the images

To delete the self-built images run:
```bash
$ docker rmi steynovich/spotweb:latest
```

## Delete the volumes
```bash
$ docker rm spotweb_db spotweb_cache
```
