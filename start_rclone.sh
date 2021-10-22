umount /mnt/exposed-pi;
sudo rm -rf /mnt/exposed-pi;

sudo mkdir /mnt/exposed-pi;
sudo chmod 777 /mnt/exposed-pi

rclone mount --vfs-cache-mode writes --allow-other exposed-pi:/ /mnt/exposed-pi/ &

sleep 1;
