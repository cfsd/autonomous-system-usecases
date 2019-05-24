#!/bin/bash

sleep 5
docker stop $(docker ps -q)
cd /home/cfsd/script
docker-compose -f state-machine-test.yml down
docker-compose -f state-machine-test.yml up -d
