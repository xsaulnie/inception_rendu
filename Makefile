
all: on

re : off rmi on

on:
	mkdir -p /home/xsaulnie/data/website
	mkdir -p /home/xsaulnie/data/database
	sudo docker-compose -f srcs/docker-compose.yml up -d --build
off:
	sudo docker-compose -f srcs/docker-compose.yml stop
	sudo docker system prune 
rmv:
	sudo docker volume rm inception_database
	sudo docker volume rm inception_website
	sudo rm -Rf /home/xsaulnie/data/website
	sudo rm -Rf /home/xsaulnie/data/database

rmi:
	sudo docker rmi srcs_mariadb
	sudo docker rmi srcs_wordpress
	sudo_docker rmi srcs_nginx
rmiv:
	sudo docker rmi srcs_mariadb
	sudo docker rmi srcs_wordpress
	sudo docker rmi srcs_nginx
	sudo docker volume rm srcs_database
	sudo docker volume rm srcs_website
	sudo rm -Rf /home/xsaulnie/data/website
	sudo rm -Rf /home/xsaulnie/data/database

