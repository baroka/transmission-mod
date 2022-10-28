```shell
Docker image for linuxserver/transmission mod. Adds cron and magnet watch

PREREQUISITES
 - Docker installed
 - linuxserver/transmission

INSTALLATION
 - Docker compose example: 

# Transmission
  transmission:
    container_name: transmission
    image: linuxserver/transmission:latest
    restart: unless-stopped
    depends_on:
      - openvpn
    network_mode: "service:openvpn"
    security_opt:
      - no-new-privileges:true
    volumes:
      - $DOCKERDIR/transmission/config:/config
      - $DOCKERDIR/transmission/download:/downloads
      - $DOCKERDIR/transmission/watch:/watch
      - $DOCKERDIR/transmission/scripts:/scripts:ro
    environment:
      - TZ=$TZ
      - PGID=$PGID
      - PUID=$PUID
      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
      - PS1=${WHOAMI}@${HOSTNAME}:${PWD}$$
      - HOME=/$WHOAMI
      - TERM=xterm
      - TRANSMISSION_WEB_HOME=/transmission-web-control/
      - DOCKER_MODS=baroka/transmission-mod:latest

 - $DOCKERDIR points to your local path for script files
```
