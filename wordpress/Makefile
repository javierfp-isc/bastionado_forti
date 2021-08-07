PROJECT="forti"
SERVICES=wordpress mysql hack

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

composedelete: composedown
	for s in ${SERVICES};do docker rmi -f ${PROJECT}_$$s;done

composedown:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml rm -f

composestart:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start	

composestop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop


