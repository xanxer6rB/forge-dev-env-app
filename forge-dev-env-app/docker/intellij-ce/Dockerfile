FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

ENV  UBUNTU_FRONTEND=noninteractive
ENV HOME=/config
WORKDIR /config
VOLUME /config
RUN \
    apt-get update; sudo apt-get upgrade -y; apt-get install nano openjdk-11-jdk bzip2 wget curl apt-utils libcanberra-gtk3-module git -y && \ 
    rm -rf /var/cache/apk/* && \
    echo '#!/bin/bash\n/opt/idea-IC-242.20224.300/bin/idea.sh' > intellij-ce.sh && \
    chmod +x intellij-ce.sh \
    && apt-cache policy git \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/* \ 
    && rm -rf /tmp/*  \
    && rm -rf /var/cache/apk/* \
    && rm /config/intellij-ce.sh

##############################################
# Install IntelliJ Community Edition IDEA
##############################################
ARG IJ_TARBALL=ideaIC-2024.2.tar.gz
ARG IJ_VERSION=IntelliJIdea2024.2
ARG IJ_INSTALL_DIR=/opt
ENV IJ_SETUP_SCRIPT_DIR_CNTR=${IJ_INSTALL_DIR}/idea-IC-242.20224.300/bin
COPY ${IJ_TARBALL} $IJ_INSTALL_DIR 
RUN  cd ${IJ_INSTALL_DIR}   \
  && tar -xf  ${IJ_TARBALL} \
  && rm -f ${IJ_TARBALL}

##########################################################################
# Need to create IJ directories here and then set persmissions for end
# user or else when bind mounting, they will always be owned by root
##########################################################################

RUN mkdir -p ${HOME}/.config/JetBrains/IdeaIC2024.2 &&     \
    mkdir -p ${HOME}/.local/share/JetBrains/IdeaIC2024.2 &&   \
    mkdir -p ${HOME}/.local/share/JetBrains/consentOptions &&   \
    mkdir -p ${HOME}/.java/.userPrefs
