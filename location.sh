#!/bin/bash

if [ "$1" == "" ]
then
    echo "Usage: $0 IP"
    exit
fi

res=$(curl http://ip-api.com/json/$1 -s)
status=$(echo $res | jq '.status' -r)
if [ $status == "success" ]
then
    city=$(echo $res | jq '.city' -r)
    echo "City: $city"
    region=$(echo $res | jq '.regionName' -r)
    echo "Region: $region"
    country=$(echo $res | jq '.country' -r)
    echo "Country: $country"
fi    
