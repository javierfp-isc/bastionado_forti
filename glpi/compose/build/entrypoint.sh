#!/bin/bash

#Arrancamos apache y mysql
[ -d /var/lib/mysql ] && service mariadb start
[ -d /var/www/html ] && service apache2 start

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

