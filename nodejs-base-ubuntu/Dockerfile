# Dockerfile

# Pull base image.
FROM phusion/baseimage:0.9.22

MAINTAINER Anmol Nagpal <ianmolnagpal@gmail.com>
ENV NODEJS_MAJOR 7.10
ENV NODEJS_VERSION 7.10.0
ENV DEBIAN_FRONTEND noninteractive
RUN export LANG=C.UTF-8 && export LC_ALL=en_US.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get install -y          \
    nodejs                      \
    build-essential             \
    pkg-config                  \
    libssl-dev                  \
    libsslcommon2-dev

RUN npm install -g \
    pm2            \
    webpack        \
    bower          \
    gulp           \
    node-sass      \
    gulp-sass      \
    typescript     \
    typings        \
    express        \
    express-server

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www