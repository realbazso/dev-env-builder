#!/bin/bash

export myflavor=dev
  
mkdir -p /docker/registry/$myflavor/repo
mkdir -p /docker/registry/$myflavor/db

if [ ! -e /docker/registry/config.yml ] 
 then
  wget https://raw.githubusercontent.com/docker/docker-registry/master/config/config_sample.yml
  mv config_sample.yml /docker/registry/config.yml
fi

docker run \
	-e DOCKER_REGISTRY_CONFIG=/registry/config.yml \
	-e SEARCH_BACKEND=sqlalchemy \
	-e SETTINGS_FLAVOR=$myflavor \
	-e STORAGE_PATH=/registry/repo \
	-e SQLALCHEMY_INDEX_DATABASE=sqlite:////registry/db/docker-registry.db \
	-p 5000:5000 \
	-v /docker/registry/$myflavor:/registry \
	-v /docker/registry/config.yml:/registry/config.yml \
	-d \
	registry:latest
