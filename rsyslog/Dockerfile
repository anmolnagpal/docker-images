# Dockerfile

# Pull base image.
FROM alpine:3.5

MAINTAINER Anmol Nagpal <ianmolnagpal@gmail.com>

ENV RSYSLOG_MAJOR 8.26
ENV RSYSLOG_VERSION 8.26.0-r0

RUN \
    apk add --no-cache rsyslog \
    && rm -rf /var/cache/apk/*

ADD rsyslog.conf /etc/rsyslogd.conf
COPY startup.sh /startup.sh

EXPOSE 514 514/udp

ENTRYPOINT ["/startup.sh"]
