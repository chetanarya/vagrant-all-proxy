# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.hostname="all-proxy"
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.network :forwarded_port, host: 3142, guest: 3142
  #config.vm.network :forwarded_port, host: 9090, guest: 9090
  config.vm.network :forwarded_port, host: 8081, guest: 8081
  config.vm.provider "virtualbox" do |vb|
    vb.name = "all-proxy"
    vb.memory = 2048
    vb.cpus = 1
  end    
end