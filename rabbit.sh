#!/bin/bash

export myflavor=dev
  
mkdir -p /docker/rabbitmq/$myflavor/log
mkdir -p /docker/rabbitmq/$myflavor/db

docker run \
	-p 5672:5672 \
	-p 15672:15672 \
	-v /docker/rabbitmq/$myflavor/log:/data/log \
	-v /docker/rabbitmq/$myflavor/db:/data/mnesia \
	-d \
	dockerfile/rabbitmq:latest
