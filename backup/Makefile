PROJECT="backup"

#Targets principales
install: composeup

down: composedown

delete: composedelete

start: composestart

stop: composestop

restart: stop start

sh:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml ps

#Requisitos
composeup:	
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml up -d

composedelete:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down --rmi all -v

composedown:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down

composestart:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start	

composestop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop


