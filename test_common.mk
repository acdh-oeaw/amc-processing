SHELL=bash

## a common Makefile for simplifying docker commands making testing faster/easier
## basically -t(ags) and --name are automtically added to docker build and docher run  

help:
	@echo -e "\n## ATTENTION: you need to set variable T=<TAG> to the correct tag.\n\n"
	@echo -e "      currently: TAG=$(T)\n"
	@echo -e "i     docker images\n"
	@echo -e "re    re-run the full circle: stop + rmi + build + run + enter\n"
	@echo -e "b	build"
	@echo -e "rund	run in DETACHED mode\n"
	@echo -e "e       enter as root"
	@echo -e "eroot   enter as root\n"
	@echo -e "stop	stop\n"
	@echo -e "help	print this message\n"

## re-running the full circle
re: 	stop rmi b rund e
			
i:
	docker images
	
b: i
	docker build -f Dockerfile -t test:$T . && \
	docker images

#run:
#	# detached: -d
#	docker run --rm -it  \
#	--name test_$T \
#	test:$T /bin/bash

run:
	docker run --rm -it  \
	-v /home/hannes/acdh_resources:/mnt/acdh_resources:rw  \
	-v /opt/utils:/opt/utils \
	--name test_$T test:$T /bin/bash 

## run *d*etached	
rund:
	# detached: -d
	docker run -d --rm -it  \
	-v /home/hannes/acdh_resources:/mnt/acdh_resources:rw  \
	-v /opt/utils:/opt/utils \
	--name test_$T test:$T /bin/bash && \
	echo -e "\n------------\n" && \
	docker ps && \
	echo
	
stop:
	echo -e "\n## Stopping: test_$T ...\n" && \
	docker stop test_$T && \
	echo -e "\n## Status der container:" && \
	docker ps
	
rmi:
	echo -e "\# docker rmi ..."
	docker rmi test:$T

## run the REMOTE image from github
rr:
	docker run --name $(T)_remote --rm -it -u 0:0 ghcr.io/acdh-oeaw/amc-processing/$T /bin/bash
	
	
## enter - user can be overwritten in importing Makefile
e:	
	docker exec -it -u user test_$T /bin/bash


## enter explicitely as "user"
euser:	
	docker exec -it -u user test_$T /bin/bash
	
## enter as root		
eroot:	
	docker exec -it -u root test_$T /bin/bash
	

	
	

