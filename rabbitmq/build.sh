#!/usr/bin/env bash

wget -N --no-check-certificate -P ./alpine/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_message_timestamp-3.6.x-0b333722.ez
wget -N --no-check-certificate -P ./alpine/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_routing_node_stamp-3.6.x-024f8f22.ez
wget -N --no-check-certificate -P ./alpine/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_delayed_message_exchange-0.0.1.ez
wget -N --no-check-certificate -P ./alpine/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_management_themes-3.6.x-730495f1.ez
wget -N --no-check-certificate -P ./alpine/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_clusterer-1.0.3.ez

###
wget -N --no-check-certificate -P ./debian/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_message_timestamp-3.6.x-0b333722.ez
wget -N --no-check-certificate -P ./debian/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_routing_node_stamp-3.6.x-024f8f22.ez
wget -N --no-check-certificate -P ./debian/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_delayed_message_exchange-0.0.1.ez
wget -N --no-check-certificate -P ./debian/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_management_themes-3.6.x-730495f1.ez
wget -N --no-check-certificate -P ./debian/plugins/ https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_clusterer-1.0.3.ez

docker build -t anmolnagpal/rabbitmq:3.6.9-management-alpine alpine

if [[ $? != 0 ]]; then
    echo "rabbitmq alpine Build failed."
    exit 1
fi

docker push anmolnagpal/rabbitmq:3.6.9-management-alpine

docker build -t anmolnagpal/rabbitmq:3.6.9-management-debian debian

if [[ $? != 0 ]]; then
    echo "rabbitmq debian Build failed."
    exit 1
fi

docker push anmolnagpal/rabbitmq:3.6.9-management-debian