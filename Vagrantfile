# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #
  # Configuración maquina servidor SSH
 config.vm.define "srv-dhcp" do |server| 
  server.vm.box = "bento/debian-10"

  server.vm.hostname = "srv-dhcp"

  server.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm"     , :id, "--memory", "512"]
      vb.customize ["modifyvm"     , :id, "--name"  , "srv-dhcp"]
    end

  #server.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]

  #server.vm.network "private_network", ip: "192.168.33.1"
  
  server.vm.network "private_network",
      ip: "10.1.13.1",
      netmask: "255.255.0.0",
      virtualbox__intnet: "vagrant"


  #Script para instalar servicio DHCP: isc-dhcp- server 
    server.vm.provision "shell", path: "./script/instalaciones.sh"
    server.vm.provision "shell", path: "./script/dhcp.sh"
  
  end #Final configuración del servidor
 #
 # Configuración maquina cliente que obtendrá direccion por DHCP
 # Basada en la box "bento/ubuntu-16.04" con 512 de RAM
 # nombre de la maquina "c-ubuntu16"
 
 #Final configuración del cliente
end
