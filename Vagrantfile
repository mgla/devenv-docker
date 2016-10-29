# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"
hostname_prefix = 'local01-'
domain = 'local'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "devenv-docker" do |master|
    master.vm.box      = "debian/contrib-jessie64"
    master.vm.box_url  = "https://atlas.hashicorp.com/debian/contrib-jessie64"
    master.vm.hostname = "local01-devenv-docker.#{domain}"
    master.vm.network    "private_network", ip: "192.168.33.10"
    master.vm.network    "forwarded_port", guest: 8000, host: 8000
    master.vm.provision :hosts, :sync_hosts => true
    master.vm.provision :shell, :path => "Vagrant/system-prep-deb.sh"
    master.vm.synced_folder ".", "/vagrant", create: true
    master.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096", "--cpus", "2", "--ioapic", "on"]
    end
  end

end

# vi: set ft=ruby :
