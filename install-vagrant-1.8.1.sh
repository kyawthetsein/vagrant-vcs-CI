#!/bin/sh

set -x
set -e

if [ ! -e vagrant ]; then
  apt-get install vagrant1.8.1
fi

cd vagrant
#git checkout refs/tags/v1.8.1
#gem install net-ssh -v '3.0.2'
#bundle install
#rake install

if [ ! -e ~/.vagrant.d ]; then
  vagrant plugin install vagrant-aws
  vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
fi
