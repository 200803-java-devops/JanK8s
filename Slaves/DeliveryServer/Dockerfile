FROM alpine
RUN apk -U upgrade
RUN apk add nodejs 
#RUN apk add npm
#RUN npm install @kubernetes/client-node
RUN apk add curl
#docker
RUN curl -fsSL "https://download.docker.com/linux/static/stable/x86_64/docker-19.03.12.tgz" \
  | tar -xzC /usr/local/bin --strip=1 docker/docker
#kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin

COPY server.js ./
#COPY dockerpull.sh /usr/bin/dockerpull
#COPY getPods.js ./
#COPY createDeployment.js ./
COPY sample-deploy.yaml ./
EXPOSE 8086
ENTRYPOINT node server.js