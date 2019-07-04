#!/bin/bash
sudo ip link set enp9s0 up
sleep 1
#sudo ip route add 224.0.0.0/4 dev enp9s0
sleep 5
docker stop $(docker ps -q)
cd /home/cfsd/script
docker-compose -f state-machine-test.yml down
docker-compose -f state-machine-test.yml up -d
