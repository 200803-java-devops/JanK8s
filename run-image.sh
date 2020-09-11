#! /bin/sh
# Usage: ./run-image.sh <image-name> [jenkins port [agent port]]
docker run -it -p ${2:-8080}:8080 -p ${3:-50000}:50000 -v /var/run/docker.sock:/var/run/docker.sock $1