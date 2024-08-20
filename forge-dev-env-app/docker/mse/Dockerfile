FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

RUN \
    apt-get update; apt-get upgrade -y && \
    apt-get autoremove -y 
RUN apt-get install -y wget nano bzip2 cmake fuse g++ gcc libboost-dev libboost-all-dev libwxgtk3.0-gtk3-dev libhunspell-dev build-essential checkinstall git

RUN git clone https://github.com/MagicSetEditorPacks/Full-Magic-Pack.git /app/mse/mse-full-pack && \
    git clone https://github.com/twanvl/MagicSetEditor2.git /app/mse/MagicSetEditor2

RUN echo 'cmake build -DCMAKE_BUILD_TYPE=Release /app/mse/MagicSetEditor2; cmake /app/mse/MagicSetEditor2/CMakeLists.txt; sudo make -f /app/mse/MagicSetEditor2/Makefile; sudo mkdir /config/.fonts; sudo mkdir /config/.magicseteditor; sudo mkdir /config/.magicseteditor/data; sudo mkdir /config/.magicseteditor/resource; sudo mv -v /app/mse/MagicSetEditor2/* /config/.magicseteditor; sudo mv -v /app/mse/mse-full-pack/data/* /config/.magicseteditor/data; sudo mv -v /app/mse/mse-full-pack/Magic\ -\ Fonts/* /config/.fonts; sudo mv -v /app/mse/mse-full-pack/backup/resource/* /config/.magicseteditor/resource; echo "#!/bin/bash\n/config/.magicseteditor/magicseteditor" > /config/run_mse.sh; sudo chmod +x run_mse.sh; rm /config/install-mse-adv-full-pack.sh /config/CMakeCache.txt /config/cmake_install.cmake /config/CTestTestfile.cmake /config/Makefile; sudo rm -drf /config/CMakeFiles /config/src; mv magicseteditor .magicseteditor' > /config/install-mse-adv-full-pack.sh && \
    chmod +x /config/install-mse-adv-full-pack.sh