#!/bin/bash

#sudo -u magento2 sh -c '/usr/local/bin/unison -socket 5000 2>&1 >/dev/null' &
sudo -u magento2 sh -c '/usr/local/bin/unison -socket 5000' &

mkdir -p /var/supervisord
cd /var/supervisord
supervisord -n -c /etc/supervisord.conf
