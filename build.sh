#!/usr/bin/env bash

build() {
    NAME=$1
    TAG=${2:-"latest"}
    [ -d "$NAME" ] || exit 1
    sudo docker build --tag "$NAME:$TAG" "$NAME" \
        1> >(tee "$NAME/stdout.log") \
        2> >(tee "$NAME/stderr.log" >&2)
}

push() {
    # TODO: push images to registry
    # sudo docker push ...
    echo
}

# Pass the arguments
"$@"
