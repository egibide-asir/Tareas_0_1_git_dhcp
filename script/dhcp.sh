#!/bin/bash
#Autor: Blanca I-I
#
#dhcp.sh
#
#Configuración DHCP
#Copia de seguridad del fichero de configuración en mi carpeta compartida

#Copia de seguridad del fichero isc-dhcp-server

#Copiar mis ficheros de configuración de la carpeta compartida al directorio
sudo cp /vagrant/config/dhcpd.conf /etc/dhcp/dhcpd.conf
sudo cp /vagrant/config/isc-dhcp-server /etc/default/isc-dhcp-server
#
#Comprobar si hay errores sintácticos en el fichero de configuración

#Si no hay problemas, arrancar el servicio


#Comprobando que el servicio escucha en el pueto de la configuración
sudo netstat -lun|tr -s ' '|cut -d ' ' -f4|cut -d ':' -f2|grep -w 67 >>/dev/null
if test $? -ne 0
then
 	echo "Problemas con la configuración de DHCP"
else
 	echo "DHCPconfigurado ...."
fi
#Desactivar el arranque automatico del servicio al iniciar el sistema
#Al hacer sudo systemctl disable isc-dhcp-server te dice que uses el comando siguiente
sudo /lib/systemd/systemd-sysv-install disable isc-dhcp-server
#
#sudo systemctl is-enabled isc-dhcp-server