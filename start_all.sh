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

sleep 2
printf '%s\n' 'start wait for 10 sec'
sleep 1
printf 1
sleep 1
printf 2
sleep 1
printf 3
sleep 1 
printf 4
sleep 1
printf 5
sleep 1
printf 6
sleep 1 
printf 7 
sleep 1
printf 8
sleep 1
printf '%s\n' "9"
sleep 1


# echo $folder
# echo "folder="$folder
echo 'folder=/tmp/'$folder > .env
cat .env

docker-compose up
