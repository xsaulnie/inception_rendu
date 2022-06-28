FROM debian:10

RUN apt update
RUN apt-get install -y openssl php php-fpm php-json mariadb-client php-mysqli php-phar \
php-curl php-dom php-exif php-fileinfo php-mbstring php-xml php-zip
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
RUN apt-get install curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update
COPY tools/config_create.sh /etc/config_create.sh
EXPOSE 9000

CMD ["/bin/bash", "/etc/config_create.sh"]
