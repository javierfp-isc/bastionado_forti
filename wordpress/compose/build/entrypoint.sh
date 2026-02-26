#!/bin/bash

#Arrancamos apache
[ -d /var/www/html ] && service apache2 start

#Arranque de mariadb y creación de BBDD
if [ -d /var/lib/mysql ]
then
	if [ "$(stat -c '%U:%G' /var/lib/mysql)" != "mysql:mysql" ]; then
    	chown -R mysql:mysql /var/lib/mysql
	fi
	service mariadb start
	#Crea la base de datos si no existe
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $WPDB"
	#Crea el usuario WPUSER si no existe y le otorga permisos a la base de datos
	if [ $(mysql -uroot -D mysql -s -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$WPUSER')") ]
	then
		mysql -uroot -e "GRANT ALL ON $WPDB.* TO '$WPUSER'@'%' IDENTIFIED BY '$WPPASS'"
	fi
fi

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

