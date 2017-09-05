FROM php:apache

MAINTAINER Arne Schubert <atd.schubert@gmail.com>

ARG MAPBENDER_URL="http://mapbender3.org/builds/3.0.6.3/mapbender3-starter-3.0.6.3.tar.gz"

ENV MAPBENDER_URL $MAPBENDER_URL

RUN set -x \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    curl \
    php-apc \
    zlib1g-dev \
    libbz2-dev \
    libxml2-dev \
    postgresql-server-dev-all \
    libwebp-dev \
    libjpeg-dev \
    libpng12-dev \
    libxmp-dev \
    libicu-dev \
    libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/* \
  && curl -o /usr/bin/composer https://getcomposer.org/composer.phar \
  && chmod a+x /usr/bin/composer \
  && mkdir -p /srv/www/mapbender \
  && curl $MAPBENDER_URL | tar -C /srv/www/mapbender -xz \
  && mv /srv/www/mapbender/**/* /srv/www/mapbender/ \
  && chown -R www-data:www-data /srv/www/mapbender \
  && rm /etc/apache2/sites-enabled/* \
  && docker-php-source extract \
  && docker-php-ext-install zip \
  && docker-php-ext-install bz2 \
  && docker-php-ext-install xml \
  && docker-php-ext-install mbstring \
  && docker-php-ext-install pdo_pgsql \
  && docker-php-ext-install gd \
  && docker-php-ext-install intl \
  && docker-php-ext-install pdo_sqlite \
  && docker-php-source delete \
  && a2enmod rewrite

COPY ./mapbender-apache.conf /etc/apache2/sites-enabled/mapbender.conf
COPY ./mapbender-console.sh /usr/local/bin/mapbender-console
COPY ./mapbender-composer.sh /usr/local/bin/mapbender-composer

USER www-data
VOLUME /srv/www/mapbender/
WORKDIR /srv/www/mapbender/

USER root
