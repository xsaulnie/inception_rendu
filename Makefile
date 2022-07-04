DOCKER_PS=$(shell docker ps -qa)
DOCKER_IM=$(shell docker images -qa)
DOCKER_VM=$(shell docker volume ls -q)
DOCKER_NT=$(shell docker network ls -q)

all: on

re : off rmi on

on:
	mkdir -p /home/xsaulnie/data/website
	mkdir -p /home/xsaulnie/data/database
	sudo docker-compose -f srcs/docker-compose.yml up -d --build
off:
	sudo docker-compose -f srcs/docker-compose.yml stop
	sudo docker system prune
stop:
	sudo docker-compose -f srcs/docker-compose.yml stop
rmv:
	-sudo docker volume rm inception_database
	-sudo docker volume rm inception_website
	-sudo rm -Rf /home/xsaulnie/data/website
	-sudo rm -Rf /home/xsaulnie/data/database

rmi:
	-sudo docker rmi srcs_mariadb
	-sudo docker rmi srcs_wordpress
	-sudo_docker rmi srcs_nginx
rmiv:
	-sudo docker rmi srcs_mariadb
	-sudo docker rmi srcs_wordpress
	-sudo docker rmi srcs_nginx
	-sudo docker volume rm srcs_database
	-sudo docker volume rm srcs_website
	-sudo rm -Rf /home/xsaulnie/data/website
	-sudo rm -Rf /home/xsaulnie/data/database
	-sudo rm -Rf /home/xsaulnie/data
rmeval:
	-docker stop $(DOCKER_PS)
	-docker rm $(DOCKER_PS)
	docker rmi -f $(DOCKER_IM)
	docker volume rm $(DOCKER_VM)
	docker network rm $(DOCKER_NT) 2>/dev/null
	-sudo rm -Rf /home/xsaulnie/data/website
	-sudo rm -Rf /home/xsaulnie/data/database
	-sudo rm -Rf /home/xsaulnie/data

