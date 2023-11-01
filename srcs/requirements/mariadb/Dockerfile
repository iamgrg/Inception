FROM debian:bullseye

RUN apt update && apt upgrade && apt-get install mariadb-server -y
RUN mkdir -p /run/mysqld/ && chown mysql:mysql /run/mysqld/
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/init_db.sh /usr/local/bin/
CMD ["/usr/local/bin/init_db.sh"]

