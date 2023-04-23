
## Docker Yocto Builder

Dockerfile's which describes a container capable of building Yocto Images. 

* Working with Yocto Rocko, Dunfell and Kirkstone.

* How to build:

```shell
docker build -t yocto-rocko -f Dockerfile.rocko .
docker build -t yocto-dunfell -f Dockerfile.dunfell .
docker build -t yocto-kirkstone -f Dockerfile.kirkstone .
```

* How to run:

```shell
docker run --rm -it --privileged -v <my-folder-project>:/home/yocto/poky -v /tmp:/tmp -v /etc/localtime:/etc/localtime yocto-<version>:latest
```

Note: Replace <my-folder-project> with the folder where all the Yocto files are (like Poky, for example) and <version> with rocko, dunfell or kirkstone.

