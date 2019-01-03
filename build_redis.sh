#!/usr/bin/env bash

REDIS_BUILD_DIR=/home/vagrant/redis-build
REDIS_DIR=/home/vagrant/redis
REDIS_SUPERVISOR_CONF=/etc/supervisor/conf.d/redis.conf
REDIS_PORTS=$(seq 7000 7005)

# download, unpack and build redis
rm -rf $REDIS_BUILD_DIR
git clone  -b 4.0 https://github.com/antirez/redis.git $REDIS_BUILD_DIR

pushd $REDIS_BUILD_DIR

make
make install
sudo cp ./src/redis-trib.rb /usr/local/bin/redis-trib.rb
sudo cp ./redis.conf /etc/redis.conf

popd
