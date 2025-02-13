#!/bin/bash

#Arrancamos apache y mysql
[ -d /var/lib/mysql ] && service mariadb start
[ -d /var/www/html ] && service apache2 start

#Arrancamos zabbix
[ -f /etc/init.d/zabbix-server ] && /etc/init.d/zabbix-server start
[ -f /etc/init.d/zabbix-agent ] && /etc/init.d/zabbix-agent start

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

