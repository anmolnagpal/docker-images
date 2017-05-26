# Dockerfile

# Pull base image.
FROM php:7.1.5-fpm-alpine

MAINTAINER Anmol Nagpal <ianmolnagpal@gmail.com>
ENV PHP_MAJOR 7.1
ENV PHP_VERSION 7.1.5

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories

RUN apk add --no-cache --virtual .persistent-deps \
    wget                    \
	perl                    \
	curl                    \
	git                     \
	grep                    \
	gmp-dev                 \
	freetype-dev            \
	libxpm-dev              \
	libwebp-dev             \
	libjpeg-turbo-dev       \
	libjpeg                 \
	libpng                  \
	libpng-dev              \
	zip                     \
	unzip                   \
	vim                     \
	nano                    \
	openssh                 \
	heimdal-telnet          \
	zsh                     \
	figlet                  \
	bzip2-dev               \
	openssl-dev             \
	build-base              \
	tar                     \
	file                    \
	htop                    \
	python py-pip           \
	curl-dev                \
	libmcrypt-dev           \
	re2c                    \
	icu-dev                 \
	libc-dev                \
	pkgconf                 \
	make                    \
	autoconf                \
	g++                     \
	gcc                     \
	cmake                   \
	libxml2-dev             \
	imap-dev

ENV RABBITMQ_VERSION v0.8.0
ENV PHP_AMQP_VERSION v1.9.0
ENV PHP_REDIS_VERSION 3.1.1
ENV PHP_MONGO_VERSION 1.2.8

RUN apk add --no-cache --virtual .persistent-deps \
    # for mongodb
    libssl1.0

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
    && docker-php-ext-configure mysqli   --enable-mysqli   \
    && docker-php-ext-configure bcmath   --enable-bcmath   \
    && docker-php-ext-configure intl     --enable-intl     \
    && docker-php-ext-configure mcrypt   --enable-mcrypt   \
    && docker-php-ext-configure pcntl    --enable-pcntl    \
    && docker-php-ext-configure mbstring --enable-mbstring \
    && docker-php-ext-configure soap     --enable-soap     \
    && docker-php-ext-configure gd       --enable-gd       \
    && docker-php-ext-configure gmp      --enable-gmp      \
    && docker-php-ext-configure imap     --enable-imap     \
    && docker-php-ext-configure json     --enable-json     \
    && docker-php-ext-configure opcache  --enable-opcache  \
    && docker-php-ext-configure bz2      --enable-bz2      \
    && docker-php-ext-install \
        mysqli   \
        bcmath   \
        intl     \
        mcrypt   \
        pcntl    \
        mbstring \
        soap     \
        gd       \
        gmp      \
        imap     \
        json     \
        opcache  \
        bz2      \
    && git clone --branch ${RABBITMQ_VERSION} https://github.com/alanxz/rabbitmq-c.git /tmp/rabbitmq \
        && cd /tmp/rabbitmq \
        && mkdir build && cd build \
        && cmake .. \
        && cmake --build . --target install \
        # workaround for linking issue
        && cp -r /usr/local/lib64/* /usr/lib/ \
    && git clone --branch ${PHP_AMQP_VERSION} https://github.com/pdezwart/php-amqp.git /tmp/php-amqp \
        && cd /tmp/php-amqp \
        && phpize  \
        && ./configure  \
        && make  \
        && make install \
        && make test \
    && git clone --branch ${PHP_REDIS_VERSION} https://github.com/phpredis/phpredis /tmp/phpredis \
        && cd /tmp/phpredis \
        && phpize  \
        && ./configure  \
        && make  \
        && make install \
        && make test \
    && git clone --branch ${PHP_MONGO_VERSION} https://github.com/mongodb/mongo-php-driver /tmp/php-mongo \
        && cd /tmp/php-mongo \
        && git submodule sync && git submodule update --init \
        && phpize  \
        && ./configure  \
        && make  \
        && make install \
        && make test \
    && apk del .build-deps \
    && rm -rf /tmp/* \
    && rm -rf /var/www \
    && mkdir -p /var/www

# Possible values for ext-name:
# bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl
# json ldap mbstring mcrypt mssql mysql mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci
# pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap
# sockets spl standard sybase_ct sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip

# Copy configuration
COPY config/php.ini /usr/local/etc/php/
COPY config/php7.ini /usr/local/etc/php/conf.d/
COPY config/amqp.ini /usr/local/etc/php/conf.d/
COPY config/redis.ini /usr/local/etc/php/conf.d/
COPY config/opcache.ini /usr/local/etc/php/conf.d/
COPY config/mongodb.ini /usr/local/etc/php/conf.d/
COPY config/fpm/php-fpm.conf /usr/local/etc/
COPY config/fpm/pool.d /usr/local/etc/pool.d

# Install composer global bin
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer  && \
    composer global require hirak/prestissimo && \
    pip install supervisor supervisor-stdout pip --upgrade

#RUN apk add --update --no-cache .persistent-deps \
#    libressl

RUN apk add --no-cache --virtual mongodb-tools
RUN apk add --no-cache --virtual redis

RUN \
    # Purge dev APK packages
    apk del --purge *-dev build-base autoconf libtool && \

    # Cleanup after phpizing
    rm -rf /usr/include/php7 /usr/lib/php7/build /usr/lib/php7/modules/*.a && \

    # Remove redis binaries and config
    ls /usr/bin/redis-* | grep -v redis-cli | xargs rm  && \
    rm -f /etc/redis.conf                               && \

    # Final cleanup
    rm -rf /var/cache/apk/* /tmp/* /usr/share/man

WORKDIR /var/www