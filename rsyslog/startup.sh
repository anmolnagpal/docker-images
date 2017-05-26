#!/bin/sh

rm /run/rsyslogd.pid || /bin/true

rsyslogd -n -i /run/rsyslogd.pid -f /etc/rsyslogd.conf