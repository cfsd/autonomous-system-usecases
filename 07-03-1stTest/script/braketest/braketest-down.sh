#!/bin/bash

sleep 5

docker-compose -f braketest.yml down

docker-compose -f camera-imu-data-collection.yml down

