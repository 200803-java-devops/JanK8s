From maven:3.3.9-jdk-8-alpine
ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 19.03.12
USER root
# DOCKER_GID should correspond to the group id of the docker group. You can check it on Linux systems with 'getent group docker'
RUN apk -U upgrade
RUN apk add curl
RUN curl -fsSL "https://download.docker.com/linux/static/stable/x86_64/docker-19.03.12.tgz" \
  | tar -xzC /usr/local/bin --strip=1 docker/docker