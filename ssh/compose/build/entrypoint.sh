#!/bin/bash

#Establece los servidores DNS a 8.8.8.8 y 8.8.4.4
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

#Cargamos iptables almacenadas
[ -f /etc/iptables/rules.v4 ] && iptables-restore < /etc/iptables/rules.v4

##Arrancamos rsyslog
rsyslogd

#Arrancamos ssh
[ -f /etc/ssh/sshd_config ] && service ssh start

##Arrancamos fail2ban
[ -f /etc/init.d/fail2ban ] & rm -rf /var/run/fail2ban/fail2ban.sock & service fail2ban start

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

