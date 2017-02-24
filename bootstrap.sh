#!/bin/bash
rm /etc/nginx/conf.d/default.conf
/confd -onetime -backend etcd -node ${ETCD_IP}:2379
tail -f /dev/null