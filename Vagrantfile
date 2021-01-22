# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_PREFIX = "172.30.1.1"

RANGE = (0..5)

HOSTS = RANGE.map { |i|
  ["#{IP_PREFIX}#{i}", ["redis-node-#{i}"]]
}.to_h


ETC_HOSTS = HOSTS.map { |ip, hosts| "#{ip} #{hosts[0]}"}.join("\n")

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # only if you need to update your host's /etc/hosts. See https://github.com/agiledivider/vagrant-hostsupdater for details
  # config.hostsupdater.aliases = HOSTS

  config.vm.provision "docker" do |d|
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo echo "#{ETC_HOSTS}" | sudo tee -a /etc/hosts
  SHELL

  RANGE.each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.network "private_network", ip: "#{IP_PREFIX}#{i}"
      node.vm.network "forwarded_port", id: "ssh", host: 2200+i, guest: 22
      node.vm.post_up_message = "Hello, my IP is #{IP_PREFIX}#{i}"
    end
  end
end
