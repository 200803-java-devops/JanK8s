#! /bin/sh
# Usage: ./run-image.sh <image-name> <github token env> <docker hub username env> <docker hub token env> [jenkins port [agent port]]
docker run -it -e "$2" -e "$3" -e "$4" -e "${5:-MY_JENKINS_PROXY=http://localhost:8080/github-webhook/}" -p ${6:-8080}:8080 -p ${7:-50000}:50000 -v /var/run/docker.sock:/var/run/docker.sock $1
