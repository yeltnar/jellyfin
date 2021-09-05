umount /mnt/exposed-pi;
sudo rm -rf /mnt/exposed-pi;

sudo mkdir /mnt/exposed-pi;

sudo chown drew /mnt/exposed-pi
sudo chgrp drew /mnt/exposed-pi

rclone mount --allow-non-empty exposed-pi:/ /mnt/exposed-pi/ &

ls /mnt/exposed-pi
