## Docker Yocto Builder
Dockerfile which describes a container capable of building Yocto Images. Note: You need to download Poky in order to build an image using Yoto. Refer to Yocto documentation on how to do it.
* Working with Yocto Dunfell or later (uses ubuntu 20.04 image).
* If you don't want to build it, you can download my image from docker Hub:
```
docker pull hiagofranco/yocto-builder:latest
```
* How to build:
```
docker build . -t hiagofranco/yocto-builder
```
* How to run:
```
docker run --rm -it --privileged -v ~/Projects/poky/:/home/yocto/poky -v /tmp:/tmp -v /etc/localtime:/etc/localtime --hostname linux --name yocto hiagofranco/yocto-builder:latest /bin/bash
```
Note: replace "Projects" folder and the name of your image with whatever you want.
* Inspired by B2Open training: https://www.b2open.com/
