#!/bin/bash

export myflavor=dev
  
mkdir -p /docker/base/$myflavor/home

id=$(docker run \
	-v /docker/base/$myflavor/home:/home \
	-d \
	dev-env-base:latest)

echo "You can ssh to my IP:"
docker inspect $id |grep -i ipa
echo " "
echo "you can find the key here: /docker/base/dev/home/dev/.ssh"
echo "Example: ssh -i /docker/base/dev/home/dev/.ssh/dev.key dev@172.17.0.37"

