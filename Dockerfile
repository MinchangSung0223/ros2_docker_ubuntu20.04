FROM nvidia/cudagl:11.2.1-devel-ubuntu20.04
MAINTAINER minchang <tjdalsckd@gmail.com>
RUN apt-get update &&  apt-get install -y -qq --no-install-recommends \
    libgl1 \
    libxext6 \ 
    libx11-6 \
   && rm -rf /var/lib/apt/lists/*

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y wget
RUN apt-get install -y sudo curl
RUN sudo apt update && sudo apt install -y curl gnupg2 lsb-release
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN bash -c "mkdir -p ~/ros2_foxy; cd ~/ros2_foxy;wget https://github.com/ros2/ros2/releases/download/release-foxy-20201211/ros2-foxy-20201211-linux-focal-amd64.tar.bz2; tar xf *.tar.bz2"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Minsk
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        tzdata \
    && rm -rf /var/lib/apt/lists/*
RUN sudo apt update
RUN sudo apt-get install -y libpyside2-dev
RUN sudo apt install -y python3-rosdep
RUN bash -c "cd ~/ros2_foxy; sudo rosdep init; sudo rosdep update; sudo rosdep install --from-paths ~/ros2_foxy/ros2-linux/share --ignore-src --rosdistro foxy -y --skip-keys 'console_bridge fastcdr fastrtps osrf_testing_tools_cpp poco_vendor rmw_connextdds rti-connext-dds-5.3.1 tinyxml_vendor tinyxml2_vendor urdfdom urdfdom_headers'"
RUN sudo apt install -y libpython3-dev python3-pip
RUN pip3 install -U argcomplete
RUN bash -c "echo -e '. ~/ros2_foxy/ros2-linux/setup.bash' >> ~/.bashrc"
EXPOSE 80
EXPOSE 443
