#!/bin/bash

repositories=( cfsd18-perception-detectcone cfsd18-sensation-attention opendlv-logic-cfsd18-sensation-slam
	cfsd18-perception-ukf cfsd18-cognition-detectconelane cfsd18-cognition-track logic-action-steering 
	logic-action-motion)

for i in "${repositories[@]}"
do
	    web="https://registry.hub.docker.com/v2/repositories/chalmersfsd/$i/tags/"
	    date=$(curl -s "$web"| jq -r 'first(."results"[]["last_updated"])')
	    tag=$(curl -s "$web"| jq -r 'first(."results"[]["name"])')
	    echo $date
        echo chalmersfsd/$i:$tag
        echo ""
done


