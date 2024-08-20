FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

RUN apt-get update; apt-get upgrade -y; apt-get install -y wget nano && \
    mkdir /app/tiled && \
    wget https://github.com/mapeditor/tiled/releases/download/v1.11.0/Tiled-1.11.0_Linux_Qt-6_x86_64.AppImage && \
    mv Tiled-1.11.0_Linux_Qt-6_x86_64.AppImage /app/tiled/Tiled-1.11.0_Linux_Qt-6_x86_64.AppImage

RUN chmod +x /app/tiled/Tiled-1.11.0_Linux_Qt-6_x86_64.AppImage && \
    /app/tiled/Tiled-1.11.0_Linux_Qt-6_x86_64.AppImage --appimage-extract && \
    mv -v squashfs-root /app/tiled && \
    rm /app/tiled/Tiled-1.11.0_Linux_Qt-6_x86_64.AppImage && \
    echo '#!/bin/bash\n/app/tiled/squashfs-root/AppRun' > /config/run_tiled_map_editor.sh