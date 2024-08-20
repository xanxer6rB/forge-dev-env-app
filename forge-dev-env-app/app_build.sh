#!/bin/bash
echo "A docker project to containerize some apps for a forge-dev-env"
PS3='Choose One: '
forge=("BUILD: Intellij-ce IDE" "BUILD: Magic Set Editor 2 - Advanced" "BUILD: Tiled - Map Editor" "RUN: Intellij-ce container and remove container after exit" "RUN: Magic Set Editor 2 - Advanced container and remove container after exit" "RUN: Tiled - Map Editor container and remove container after exit" "DETACHED: Intellij-ce container. Will retain data after exit" "DETACHED: Magic Set Editor 2 - Advanced container. Will retain data after exit" "DETACHED: Tiled - Map Editor container. Will retain data after exit" "COMPOSE BUILD: Forge dev env with Intellij-ce, MSE and Tiled" "COMPOSE BUILD DETACHED: Forge dev env with Intellij-ce, MSE and Tiled" "Quit")
select fav in "${forge[@]}"; do
    case $fav in
        ("BUILD: Intellij-ce IDE")
        docker build --build-arg IJ_TARBALL=ideaIC-2024.2.tar.gz -t intellij-ce ./docker/intellij-ce
        #docker build -t forge-dev-ide .
        break
        ;;
        ("BUILD: Magic Set Editor 2 - Advanced")
        docker build -t mse ./docker/mse
        #docker build -t forge-dev-ide .
        break
        ;;
        ("BUILD: Tiled - Map Editor")
        docker build -t tiled ./docker/tiled
        #docker build -t forge-dev-ide .
        break
        ;;
        ("RUN: Intellij-ce container and remove container after exit")
        docker run --rm -it -p 3003:3000 intellij-ce bash
        break
        ;;
        ("RUN: Magic Set Editor 2 - Advanced container and remove container after exit")
        docker run --rm -it -p 3004:3000 mse bash
        break
        ;;
        ("RUN: Tiled - Map Editor container and remove container after exit")
        docker run --rm -it -p 3005:3000 tiled bash
        break
        ;;
        ("DETACHED: Intellij-ce container. Will retain data after exit")
        docker run -d -it -p 3003:3000 intellij-ce bash
        break
        ;;
        ("DETACHED: Magic Set Editor 2 - Advanced container. Will retain data after exit")
        docker run -d -it -p 3004:3000 mse bash
        break
        ;;
        ("DETACHED: Tiled - Map Editor container. Will retain data after exit")
        docker run -d -it -p 3005:3000 tiled bash
        break
        ;;
        ("COMPOSE BUILD: Forge dev env with Intellij-ce, MSE and Tiled")
        docker compose up
        ;;
        ("COMPOSE BUILD DETACHED: Forge dev env with Intellij-ce, MSE and Tiled")
        docker compose up -d
        ;;
        ("Quit")
        echo "Now exiting"
        exit
        ;;
        (*) echo "invalid option $REPLY";;
    esac
done