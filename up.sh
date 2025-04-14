env_file="$HOME/.config/jellyfin/changeme.env"
podman-compose --env-file "$env_file" --verbose up --build -d |& tee log.txt

