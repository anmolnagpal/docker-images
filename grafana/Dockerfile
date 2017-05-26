# Dockerfile

# Pull base image.
FROM debian:jessie

MAINTAINER Anmol Nagpal <ianmolnagpal@gmail.com>
ENV GRAFANA_MAJOR 4.3
ENV GRAFANA_VERSION 4.3.1
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y --no-install-recommends install libfontconfig curl ca-certificates && \
    apt-get clean && \
    curl https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_${GRAFANA_VERSION}_amd64.deb > /tmp/grafana.deb && \
    dpkg -i /tmp/grafana.deb && \
    rm /tmp/grafana.deb && \
    curl -L https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 > /usr/sbin/gosu && \
    chmod +x /usr/sbin/gosu
RUN apt-get clean &&  apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

COPY ./run.sh /run.sh

ENTRYPOINT ["/run.sh"]

