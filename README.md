# forge-dev-env-app
Dockerized apps for a forge developement environment using KasmVNC as a base image.
https://github.com/linuxserver/docker-baseimage-kasmvnc

First you will need to download intellij-ce from their website and store it in the intellij-ce folder with the Dockerfile.

To build images or start containers run:
  - bash app_build.sh
    
It will give a list of options to either:
  - Build a docker image for Intellij-ce, Magic Set Editor 2 - Advanced, or Tiled - Map Editor
  - Start a container from one of the built images
  - Build images and start containers using docker-compose

Access containers through browser with each port:
  - Intellij-ce:                   localhost:3003
  - Magic Set Editor 2 - Advanced: localhost:3004
  - Tiled - Map Editor:            localhost:3005


TODO: figure out a way to set up intellij-ce with forge defaults after container is setup.
