#!/bin/bash
#echo "I am provisioning with a shell script"

if which java >/dev/null; then
    echo "skip java 8 installation"
else
  echo "java 8 installation"
  apt-get install --yes python-software-properties
  add-apt-repository ppa:webupd8team/java
  apt-get update -qq
  echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
  apt-get install --yes oracle-java8-installer
  yes "" | apt-get -f install
fi
mkdir sw && cd sw
echo "Downloading nexus"
wget https://sonatype-download.global.ssl.fastly.net/nexus/oss/nexus-2.11.4-01-bundle.tar.gz
tar -zxvf nexus-2.11.4-01-bundle.tar.gz
sudo mkdir -p /opt/installs
sudo mv nexus-2.11.4-01 /opt/installs/
cd /opt/installs/
sudo chown -R vagrant:vagrant nexus-2.11.4-01/
sudo cp /vagrant/nexus /etc/init.d/
sudo chmod 755 /etc/init.d/nexus
sudo chown root /etc/init.d/nexus
cd /etc/init.d
sudo update-rc.d nexus defaults
sudo service nexus start



echo "Updating cache"
sudo apt-get update
echo "Installing apt-cacher-ng"
sudo apt-get install -y apt-cacher-ng
echo "Configuring apt-cacher"
sudo cp /vagrant/02proxy /etc/apt/apt.conf.d/
echo "Reloading stuff again."
#sudo apt-get update
sudo apt-get update && sudo apt-get upgrade -y