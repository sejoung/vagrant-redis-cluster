#!/usr/bin/env bash

REDIS_BUILD_DIR=/home/vagrant/redis-build

# download, unpack and build redis
rm -rf $REDIS_BUILD_DIR
git clone -b 5.0 https://github.com/antirez/redis.git $REDIS_BUILD_DIR

pushd $REDIS_BUILD_DIR

make
make install
#sudo cp /vagrant/redis.conf /etc/redis.conf

popd
