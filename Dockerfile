# https://hub.docker.com/r/danlynn/bat/dockerfile
# https://github.com/danlynn/bat
# https://github.com/danlynn/bat/blob/48eb1bb61f9a28cdbca8f9fb32eb8d7b3a6877d3/Dockerfile
# https://github.com/sharkdp/bat

FROM alpine:latest

WORKDIR /myapp

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing bash less bat

# configure bash to check the window size after each command
RUN echo "shopt -s checkwinsize" >> ~/.bashrc

# execute `bat` after a pause so that tty can detect the current window size
ENTRYPOINT [ "sh", "-c", "bat $0 $@" ]

# docker build -t bat .
