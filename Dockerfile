
## Docker file to build a container that compiles
## new linux distros using Yocto

# Use this command to run:
# docker run --rm -it --privileged -v ~/Projects/poky/:/home/yocto/poky -v /tmp:/tmp -v /etc/localtime:/etc/localtime --hostname linux -e DISPLAY=:1 --name yocto hiagofranco/yocto-builder:latest /bin/bash


# Yocto Project 3.1 - dunfell (works with ubuntu 20.04)
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages (Yocto documentation)
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    gawk \
    wget \
    git \
    diffstat \
    unzip \
    texinfo \
    gcc \
    build-essential \
    chrpath \
    socat \
    cpio \
    python3 \
    python3-pip \
    python3-pexpect \
    xz-utils \
    debianutils \
    iputils-ping \
    python3-git \
    python3-jinja2 \
    libegl1-mesa \
    libsdl1.2-dev \
    pylint3 \
    python3-gi \
    libgtk-3-dev \
    xterm \
    python3-subunit \
    mesa-common-dev \
    zstd \
    liblz4-tool \
    tree \
    vim \
    locales \
    sudo \
    file \
    ssh \
    python \
    curl \
    libncurses-dev \
    tmux \
    && rm -rf /var/lib/apt/lists/*

# Set locale and language
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set user
ENV USER_NAME yocto 
ARG host_uid=1000
ARG host_gid=1000
RUN groupadd -g $host_gid $USER_NAME && useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME
RUN echo 'yocto:linux' | chpasswd
RUN adduser $USER_NAME sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER $USER_NAME

# Create work folder
ENV BUILD_DIR /home/${USER_NAME}
RUN mkdir -p $BUILD_DIR
WORKDIR $BUILD_DIR
