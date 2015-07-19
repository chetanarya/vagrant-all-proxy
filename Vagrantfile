# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "public_network"
  config.vm.network "private_network", type: "dhcp"
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.network :forwarded_port, host: 3142, guest: 3142
  config.vm.provider "virtualbox" do |vb|
    vb.name = "apt-cacher"
    vb.memory = 256
    vb.cpus = 1
  end    
end
#once install need to configure apt-cache as in http://www.tecmint.com/apt-cache-server-in-ubuntu/ and 
#we have working stuff in mylaptop:3142