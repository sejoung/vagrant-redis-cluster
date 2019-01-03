#!/usr/bin/env bash

REDIS_BUILD_DIR=/home/vagrant/redis-build
REDIS_DIR=/home/vagrant/redis
REDIS_SUPERVISOR_CONF=/etc/supervisor/conf.d/redis.conf
REDIS_PORTS=$(seq 7000 7005)


sudo rm -rf $REDIS_SUPERVISOR_CONF
sudo supervisorctl update

sudo rm -rf $REDIS_DIR

sudo mkdir -p $REDIS_DIR

for port in $REDIS_PORTS
do
    sudo mkdir -p $REDIS_DIR/$port
done

sudo cp /vagrant/redis.conf $REDIS_SUPERVISOR_CONF

sudo rm -rf "$REDIS_DIR/$port/nodes.conf"

sudo supervisorctl update

sleep 2

echo "======================================"
echo "INITIALIZING REDIS CLUSTER            "
echo "======================================"


redis_host_list=""

for port in $REDIS_PORTS
do
    redis_host_list="$redis_host_list 127.0.0.1:$port "
done

yes "yes" | sudo /usr/local/bin/redis-trib.rb create --replicas 1 $redis_host_list