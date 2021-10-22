sudo podman run \
-it \
--name jellyfin \
-u 1001:1001 \
--network=host \
-v $PWD/config:/config \
-v $PWD/cache:/cache \
-v "/mnt/exposed-pi/media/pi/TOSHIBA EXT/media/movies":"/movies_dir":rw \
-v "/mnt/exposed-pi/media/pi/TOSHIBA EXT/media/tv":"/tv_dir":rw \
jellyfin/jellyfin
