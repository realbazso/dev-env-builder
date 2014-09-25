#!/bin/bash

export myflavor=dev
  
mkdir -p /docker/galera/$myflavor/log
mkdir -p /docker/galera/$myflavor/db

docker run \
	-e MYSQL_USER=admin \
	-e MYSQL_PASS=adminpass \
	-p 3306:3306 \
	-p 4444:4444 \
	-p 4567:4567 \
	-p 4568:4568 \
	-v /docker/galera/$myflavor/log:/var/log/mysql \
	-v /docker/galera/$myflavor/db:/var/lib/mysql \
	-d \
	paulczar/percona-galera:latest
