FROM alpine
RUN apk -U upgrade
RUN apk add nodejs
RUN apk add curl
RUN curl -fsSL "https://download.docker.com/linux/static/stable/x86_64/docker-19.03.12.tgz" \
  | tar -xzC /usr/local/bin --strip=1 docker/docker

COPY server.js ./

EXPOSE 8086
ENTRYPOINT node server.js