# jellyfin_docker
https://jellyfin.org/docs/general/installation/container/

1) create media/ folder
```
mkdir media
```

2) pull docker image image See: https://jellyfin.org/docs/general/installation/container/
```
docker pull jellyfin/jellyfin
```

3) run container in interactive mode bind media to media/ folder. Creates cache and config folder if not present.
```
./run.ubuntu24_jellyfin.latest.interactive.sh /media/
```

4) In browser go to <ip of your server>:8096 and do the first-time set-up
Add media 


To add media to collection go to media/ folder
```
cd media
mkdir Movies
mkdir "Movie Title (2021)"
cp "Movie Title (2021).mkv" .
```

In client: Dashboard -> press "Scan All Libraries" to add the media.
