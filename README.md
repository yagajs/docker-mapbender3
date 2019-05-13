# Mapbender for Docker

Mapbender docker image from the [YAGA Development-Team](https://yagajs.org)

## Supported tags

* `3.0.8`, `latest`
* `3.0.7.7`
* ~~`3.0.7.6`~~
* `3.0.7.5`
* `3.0.7.4`
* `3.0.7.3`
* `3.0.6.3`
* `3.0.6.2`
* `3.0.6.1`
* `3.0.6.0`

## What is Mapbender

[Mapbender](https://mapbender.org/) is the back office software and client framework for spatial data infrastructures.

## Run container

You can run the container with a command like this:

```bash
docker run -p 8080:80 yagajs/mapbender3
```

The container is bundled into the [official PHP-Apache](https://hub.docker.com/_/php/) image and pre-configured to work
with Postgres and SQ-Lite. For best experience, we recommend to use the
[YAGA Postgis / PostgreSQL](https://hub.docker.com/r/yagajs/postgis/) image. If you don't need the spatial extensions,
you can also use the [official Postgres](https://hub.docker.com/r/_/postgres/).

### Execute with docker-compose

### Exec commands

There are two helper script to make the symfony console and composer accessible easily.

#### Symfony console

The symfony console is normally accessible by running `app/console [command]` within you symfony project folder.
In this image you can also run the global command `mapbender-console [command]` without taking care of being in the
right folder. You can also run the command from the outside of docker with the `docker exec` command like this:

```bash
docker exec {name-of-my-mapender-container} mapbender-console [command]
```

#### Composer

Composer is a dependency manager for php. Symfony and Mapbender itself is served over composer. In addition there are
several provisioning commands you can call with composer. Composer is normally accessible by running a `composer.phar`
within the mapbender3 project folder. In this image cou can also run the global command `mapbender-composer [command]`
without taking care of being in the right folder. You can also run the command from the outside of docker with the
`docker exec` command like this:

```bash
docker exec {name-of-my-mapender-container} mapbender-composer [command]
```

## Enhance the image

You can put a `parameters.yml` into the `/srv/www/mapbender/app/config` folder.

You should use the `www-data` user within the container, especially not `root`!

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull
requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a
[GitHub issue](https://github.com/yagajs/docker-mapbender3/issues), especially for more ambitious contributions.
This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help
you find out if someone else is working on the same thing.

## License

This project is published under [ISC License](LICENSE).
