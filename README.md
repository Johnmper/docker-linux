# docker_linux

Linux kernel cross-compiling using docker.


```bash
# Create a docker volume to store the linux repo (separate from docker build image)
docker volume create --name linux_repo
# Build docker image for linux build
docker build . -t linux_builder:latest
# Run docker image. Open bash
docker run  -v linux_repo:/linux --name linux_container -it linux_builder:latest /bin/bash
# Inside Container Bash 
cd /linux
git clone https://github.com/Johnmper/linux.git .
```

