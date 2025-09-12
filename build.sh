#!/bin/bash

#adjust owner for docker oracle user
sudo chown 54321:54321 oradata
sudo chown -R 54321:54321 setup

docker build --force-rm=true --no-cache=true -t vulnacle .

docker run --name vulnacledb \
-p 1521:1521 \
--ulimit nofile=1024:65536 --ulimit nproc=2047:16384 --ulimit stack=10485760:33554432 --ulimit memlock=3221225472 \
-e ORACLE_PWD=FunStuff1 \
-e INIT_SGA_SIZE=2048 \
-e INIT_PGA_SIZE=500 \
-e INIT_CPU_COUNT=1 \
-e INIT_PROCESSES=100 \
-v ./oradata:/opt/oracle/oradata \
-v ./setup:/opt/oracle/scripts/setup \
 vulnacledb
