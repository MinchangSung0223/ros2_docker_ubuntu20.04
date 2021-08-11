#!/bin/bash
xhost +local:root
 docker  run  --rm -it --name gpu_voxels --privileged  --volume=/dev:/dev --gpus all --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 tjdalsckd/ros2:latest bash
