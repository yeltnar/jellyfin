#!/bin/bash

./start_rclone.sh 

if [[ ! -z $(ls /mnt/exposed-pi) ]]
then
    echo 'mounted; starting jellyfin';
    docker-compose up -d 
else
    echo 'not mounted; exiting'
fi

