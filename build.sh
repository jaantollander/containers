#!/usr/bin/env bash

build() {
    NAME=$1
    TAG=${2:-"latest"}
    sudo docker build --tag "$NAME:$TAG" "$NAME" \
        1> >(tee "$NAME/stdout.log") \
        2> >(tee "$NAME/stderr.log" >&2)
}

push() {
    NAME=$1
    TAG=${2:-"latest"}
    sudo docker tag "$NAME:$TAG" "ghcr.io/$OWNER/$NAME:$TAG"
    sudo docker push "ghcr.io/$OWNER/$NAME:$TAG"
}

# Pass the arguments
"$@"
