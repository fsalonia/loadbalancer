#!/bin/bash
rm /etc/nginx/conf.d/default.conf
echo "Starting etcd for initial configuration"
/confd -onetime -backend etcd -node ${ETCD_IP}:2379
echo "Put a continual polling confd process into the background to watch every 10 seconds"
/confd -interval -backend etcd -node ${ETCD_IP}:2379 &
tail -f /var/log/nginx/*.log