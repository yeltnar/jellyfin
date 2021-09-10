#!/bin/bash

./start_rclone.sh 

if [[ ! -z $(ls /mnt/exposed-pi) ]]
then
    echo 'mounted; starting jellyfins';
    docker-compose up -d 
else
    echo 'not mounted; exiting'
fi

