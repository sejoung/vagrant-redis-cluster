#!/usr/bin/env bash

sudo apt-get purge -y ruby1.9.1

sudo apt-add-repository ppa:brightbox/ruby-ng

sudo apt-get update -y

sudo apt-get autoremove -y

sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

sudo apt-get install -y ruby2.3 ruby2.3-dev

# need make to build redis
sudo apt-get install -y git make supervisor

sudo gem install redis
