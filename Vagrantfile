# -*- mode: ruby -*-
# vim: set ft=ruby :

ENV['VAGRANT_SERVER_URL']="https://vagrant.elab.pro"
# ENV['VAGRANT_SERVER_URL']="https://app.vagrantup.com/"

OS="ubuntu/jammy64"

MACHINES = {
  :masterBD => {
        :box_name => "ubuntu/jammy64",
        :vm_name => "masterBD",
        :net => [
                   ["192.168.255.100",  2, "255.255.255.0",  "router-net"],
                   ["192.168.50.20",   8,  "255.255.255.0"],
                ]
  },

  :slaveBD => {
        :box_name => "ubuntu/jammy64",
        :vm_name => "slaveBD",
        :net => [
                   ["192.168.255.200",  2, "255.255.255.0",  "router-net"],
                   ["192.168.50.21",  8,  "255.255.255.0"],
                ]
  },

  :backup => {
   :box_name => "ubuntu/jammy64",
   :vm_name => "backup",
   :net => [
              ["192.168.255.250",  2, "255.255.255.0",  "router-net"],
              ["192.168.50.100",  8,  "255.255.255.0"],
           ],
    # :disk => []
  },
}

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.define boxname do |box|
      if boxconfig.key?(:disk)
        box.vm.disk :disk, name: 'main', size: '60GB'
      end
      box.vm.box = boxconfig[:box_name]
      box.vm.host_name = boxconfig[:vm_name]
      box.vm.provider "virtualbox" do |v|
        v.memory = 480
        v.cpus = 1
       end

      boxconfig[:net].each do |ipconf|
        box.vm.network("private_network", ip: ipconf[0], adapter: ipconf[1], netmask: ipconf[2], virtualbox__intnet: ipconf[3])
      end

      if boxconfig.key?(:public)
        box.vm.network "public_network", boxconfig[:public]
      end
    end
    config.vm.synced_folder '.', '/vagrant', disabled: true
  end
end
