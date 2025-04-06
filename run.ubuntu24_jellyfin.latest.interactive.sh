#/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/media"
  exit 1
fi

USER_UID=$(id -u)
USER_GID=$(id -g)

mkdir config
mkdir cache

# Run the docker container
# --rm      : remove container after exiting the docker
# -it       : i = STDIN open, container listens to the keyboard
#           : t = teletypewriter
# -net=host : Let this container use my real network directly, as if it were just 
#             another app on my computer.
# --volume  : config and cache volumes for jellyfin
# --mount   : media for upload in our case, media/ folder 


docker run \
  --rm \
  -it \
  --name jellyfin \
  --user $USER_UID:$USER_GID \
  --net=host \
  --volume $(pwd)/config/:/config \
  --volume $(pwd)/cache/:/cache \
  --mount type=bind,source="$(pwd)$1",target=/media \
  jellyfin/jellyfin
