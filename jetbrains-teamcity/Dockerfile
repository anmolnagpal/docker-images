FROM java:8u111-jre-alpine


# Set TeamCity properties
ENV TEAMCITY_DATA_PATH /var/lib/teamcity

# TeamCity data is stored in a volume to facilitate container upgrade
VOLUME ${TEAMCITY_DATA_PATH}

# Download and install TeamCity to /opt
ENV TEAMCITY_VERSION 2017.1.1
ENV TEAMCITY_DOWNLOAD http://download.jetbrains.com/teamcity

RUN mkdir /opt && \
    wget -O- ${TEAMCITY_DOWNLOAD}/TeamCity-${TEAMCITY_VERSION}.tar.gz | tar xz -C /opt

RUN apk add --no-cache --virtual .persistent-deps \
     coreutils      \
     perl

# configuring the application
RUN /opt/TeamCity/bin/teamcity-server.sh configure \
    -J-Xmx6000m \
    -J-Djava.io.tmpdir=/tmp/teamcity \
    --base-url    http://localhost/


EXPOSE 8111

ENTRYPOINT ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
