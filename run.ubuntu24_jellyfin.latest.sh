#/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/media"
  exit 1
fi

USER_UID=$(id -u)
USER_GID=$(id -g)

# Run the docker container
docker run -d \
  --name jellyfin \
  --user $USER_UID:$USER_GID \
  --net=host \
  --volume jellyfin-config:/config \
  --volume jellyfin-cache:/cache \
  --mount type=bind,source=$1,target=/media \
  --restart=unless-stopped \
  jellyfin/jellyfin

