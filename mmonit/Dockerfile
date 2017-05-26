# Dockerfile

# Pull base image.
FROM phusion/baseimage:0.9.22

MAINTAINER Anmol Nagpal <ianmolnagpal@gmail.com>
ENV MMONIT_MAJOR 3.7
ENV MMONIT_VERSION 3.7.1
ENV DEBIAN_FRONTEND noninteractive
RUN export LANG=C.UTF-8 && export LC_ALL=en_US.UTF-8

RUN apt-get update && apt-get install -y mysql-client-5.7

RUN curl -o /tmp/mmonit.tar.gz https://mmonit.com/dist/mmonit-${MMONIT_VERSION}-linux-x64.tar.gz && \
 tar -zxvf /tmp/mmonit.tar.gz -C /opt/ && \
 mv /opt/mmonit-${MMONIT_VERSION} /opt/mmonit

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/mmonit

CMD ["/opt/mmonit/bin/mmonit", "-i"]