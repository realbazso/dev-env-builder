#!/bin/bash

export myflavor=dev
  
mkdir -p /docker/zookeeper/$myflavor/conf
mkdir -p /docker/zookeeper/$myflavor/tmp

docker run \
	-p 2181:2181 \
	-p 2888:2888 \
	-p 3888:3888 \
	-v /docker/zookeeper/$myflavor/conf:/opt/zookeeper-3.4.6/conf \
	-v /docker/zookeeper/$myflavor/tmp:/tmp/zookeeper \
	-d \
	jplock/zookeeper:latest
