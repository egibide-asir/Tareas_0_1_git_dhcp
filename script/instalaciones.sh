#!/bin/bash
#Autor: Blanca I-I
#Instalaciones
sudo apt-get update #Actualizar fuentes del repositorio
#Paquete para la gestión de procesos
sudo apt-get install -y htop
#Comprobamos si el paquete isc-dhcp-server esta instalado
dpkg --get-selections|grep  -w isc-dhcp-server
if test $? -ne 0
then
	echo "Instalando el servicio isc-dhcp-server ... "
	sudo  apt-get  -y install isc-dhcp-server
else
	echo "Servicio isc-dhcp-server ya instalado"
fi
#Comprobar el estado del servicio
#Como es la primera vez y no hay configuración debería estar en estado failed
sudo systemctl status isc-dhcp-server|grep "Active: failed"
if test $? -eq 0
then
	echo "Configurando el servicio isc-dhcp-server ... "
else
	echo "Servicio isc-dhcp-server activo"
	#Desactivar el arranque automatico al iniciar el sistema

fi

