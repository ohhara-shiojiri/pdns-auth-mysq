# pdns-auth-mysq
# Dockerfile is PowerDNS Authoritative Nameserver

Docker Image Create.
PowerDNS Authoritative Version 4.1.x
Generic MySQL backend


## config

''':pdns.conf
launch=gmysql
gmysql-host=mysql
gmysql-port=3306
gmysql-dbname=pdns
gmysql-user=root
gmysql-password=password
gmysql-dnssec=no
'''

## Docker-compose

''':docker-compose.yml
version: "3.3"

services:

  mysql:
    image: mariadb
    container_name: mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=password

  adminer:
    image: adminer
    container_name: adminer
    restart: always
    ports:
      - 8080:8080
    depends_on:
      - mysql

  pdns:
    image: ohhara2docker/pdns-auth-mysql
    container_name: pdns
    restart: always
    ports:
      - 53:53/tcp
      - 53:53/udp
    depends_on:
      - mysql
    volumes:
      - ./pdns.conf:/etc/pdns/pdns.conf
'''

