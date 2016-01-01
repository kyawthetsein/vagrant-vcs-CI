#!/bin/sh

apt-get install vagrant 1.8.1
vagrant plugin install vagrant-aws
vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box

