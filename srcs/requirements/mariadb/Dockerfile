FROM debian:10

RUN apt-get update && apt-get install -y mariadb-server
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
COPY tools/add_user.sh /etc/add_user.sh
CMD /etc/add_user.sh ; exec mysqld
#CMD tail -f
