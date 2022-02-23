#!/usr/bin/env bash

ARGS=("$@")

# Make sure processes in the container can connect to the x server
# Necessary so gazebo can create a context for OpenGL rendering (even headless)
XAUTH=/tmp/.docker.xauth

if [ ! -f $XAUTH ]; then
    xauth_list=$(xauth nlist $DISPLAY)
    xauth_list=$(sed -e 's/^..../ffff/' <<<"$xauth_list")
    if [ ! -z "$xauth_list" ]; then
        echo "$xauth_list" | xauth -f $XAUTH nmerge -
   else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

#Prevent executing "docker run" when xauth failed.
# if [ ! -f $XAUTH ]; then
#     echo "[$XAUTH] was not properly created. Exiting..."
#    exit 1
# fi

docker run -it \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=$XAUTH \
    -e QT_X11_NO_MITSHM=1 \
    -v "$XAUTH:$XAUTH" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "/etc/localtime:/etc/localtime:ro" \
    -v "/home/$USER/euro_ws:/root/euro_ws" \
    -v "/dev:/dev" \
    --runtime=nvidia \
    --workdir "/root/euro_ws" \
    --user "root:root" \
    --name ros_noetic \
    --network host \
    --rm \
    --privileged \
    ywyeh/ros-mrs-jetson \
    zsh 
    
# osrf/ros:noetic-desktop-full \
