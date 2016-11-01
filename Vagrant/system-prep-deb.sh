#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
whoami

# System update
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

# Install docker repo
apt-get purge "lxc-docker*"
apt-get purge "docker.io*"

apt-get update
apt-get install -y apt-transport-https ca-certificates

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

cp /vagrant/Vagrant/docker.list /etc/apt/sources.list.d/docker.list

apt-get update
# ?
#apt-cache policy docker-engine

apt-get install -y docker-engine

## Developer tooling
# Specific to this project
sudo gpasswd -a vagrant docker
# Common
apt-get install -y vim git
# Some of my more personal stuff. Comment it out if you do not like it
apt-get install -y zsh tree tmux curl

git clone https://github.com/mgla/dotfiles /home/vagrant/dotfiles && sudo -u vagrant /home/vagrant/dotfiles/deploy
chsh vagrant -s /bin/zsh

systemctl start docker

## Dependencies
