#!/bin/bash

docker-compose -f missionname.yml down

docker-compose -f missionname.yml up -d


