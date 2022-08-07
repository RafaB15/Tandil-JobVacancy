# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/focal64'

  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.hostname = 'jobvacancy'
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '1024'
    vb.name = 'jobvacancy'
  end

  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y build-essential git postgresql postgresql-contrib libpq-dev gnupg2

    sudo -u postgres psql --dbname=postgres -f /vagrant/create_dev_and_test_dbs.sql

    gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    rvm install 3.1.2
    rvm use 3.1.2
    rvm gemset create jobvacancy
    rvm gemset use jobvacancy
    gem install bundler -v 2.3.19
  SHELL
end
