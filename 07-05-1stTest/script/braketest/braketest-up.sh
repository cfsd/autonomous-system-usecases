#!/bin/bash

docker-compose -f braketest.yml down

docker-compose -f camera-imu-data-collection.yml down

docker-compose -f braketest.yml up -d

docker-compose -f camera-imu-data-collection.yml up -d
