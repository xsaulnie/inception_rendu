#!/bin/sh
if [ ! -f /tmp/wordpressIsOn ]
then
	service mysql start
	mysql -e "CREATE DATABASE wordpress ; CREATE USER 'wordpress'@'wordpress.srcs_inception_network' IDENTIFIED BY '$WORDPRESS_DB_ROOT_PASSWORD'; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'wordpress.srcs_inception_network' IDENTIFIED BY '$WORDPRESS_DB_ROOT_PASSWORD' ; flush privileges"
	service mysql stop
	touch /tmp/wordpressIsOn
fi
