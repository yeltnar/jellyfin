#!/bin/bash

# docker run node:latest node -e 'console.log(new Date().getTime());'
folder=$(docker run node:latest node -e 'console.log(new Date().getTime());')

mkdir /tmp/$folder
mkdir /tmp/$folder/ipfs
mkdir /tmp/$folder/ipns

chown $(whoami) /tmp/$folder/ipfs
chown $(whoami) /tmp/$folder/ipns

export IPFS_PATH=$(pwd)/.ipfs
echo $IPFS_PATH
ipfs config profile apply lowpower
ipfs daemon --mount --mount-ipfs=/tmp/$folder/ipfs  --mount-ipns=/tmp/$folder/ipns &

echo 'folder=/tmp/'$folder > .env
cat .env

sleep 2
printf '%s\n' 'start wait for 10 sec'
for i in {1..9}; do  printf "$i "; sleep 1; done
printf '\n'

docker-compose up
