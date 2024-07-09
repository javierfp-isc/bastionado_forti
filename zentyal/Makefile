PROJECT="zentyal"
SERVICES=hostlan1 hostlan2 zentyal

#Targets principales
install: vagrantup
#install: composeup

down: composedown vagrantdelete
#down: composedown

delete: composedelete vagrantdelete
#delete: composedelete

start: vagrantstart

stop: vagrantstop

restart: stop start

sh:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml ps

#Requisitos
vagrantup: composeup
	cd vagrant && vagrant up
composeup:	
	docker compose -p ${PROJECT} -f compose/docker-compose.yml up -d

vagrantdelete:
	cd vagrant && vagrant destroy -f
composedelete:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml down --rmi all -v

composedown:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml down

vagrantstart: composestart
	cd vagrant && vagrant up
composestart:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml start	

vagrantstop: composestop
	cd vagrant && vagrant halt
composestop:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml stop


