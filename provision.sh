#!/bin/bash
echo "I am provisioning with a shell script"
echo "Updating cache"
sudo apt-get update
echo "Installing apt-cacher-ng"
sudo apt-get install apt-cacher-ng
echo "Configuring apt-cacher"
