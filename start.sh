docker run -d \
--volume $(pwd)/config:/config \
--volume $(pwd)/cache:/cache \
--volume $(pwd)/media:/media \
--net=host \
jellyfin/jellyfin
