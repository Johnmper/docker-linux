FROM debian:buster-slim
LABEL maintainer="joaomgper <joaomgper94@gmail.com>"

# Install dependencies
RUN apt update && apt -y -q upgrade
RUN apt -y -q install build-essential git libncurses-dev bison flex libssl-dev libelf-dev
RUN apt clean

WORKDIR /linux