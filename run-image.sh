#! /bin/sh
# Usage: ./run-image.sh <image-name> <github token env> <docker hub username env> <docker hub token env> [jenkins port [agent port]]
docker run -it -e \"$2\" -e \"$3\" -e \"$4\" -p ${5:-8080}:8080 -p ${6:-50000}:50000 -v /var/run/docker.sock:/var/run/docker.sock $1
