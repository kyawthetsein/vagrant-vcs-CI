# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/ubuntu-15.04-snappy-core-stable"
# config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/ubuntu-15.04-snappy-core-stable"

  config.vm.define :local do |local|
    local.vm.box = "ubuntu/ubuntu-15.04-snappy-core-stable"
    local.vm.hostname = "vagrant-vcs"
  end

  config.vm.define :remote do |remote|
    remote.vm.box = "dummy"
    remote.vm.synced_folder "", "", disabled: true
    remote.vm.provider :aws do |aws, override|
      aws.access_key_id     = ENV['AWS_ACCESS_KEY_ID']
      aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      aws.keypair_name = "vagrant"

      aws.instance_type = "t2.micro"
      aws.region = "us-west-2"

      ## Private AMI: Amazon Linux + enable tty-less sudo
      aws.ami = "ami-df4320de"

      aws.security_groups = [ 'default' ]
      aws.tags = { 'Name' => 'vagrant-vcs' }

      override.ssh.username = "ec2-user"

      ## This private key is configured on CircleCI
      override.ssh.private_key_path = ENV['AWS_SSH_KEY_PATH']
    end
  end
end