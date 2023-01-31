#!/usr/bin/env bash

build() {
    NAME=$1
    TAG=$2
    sudo docker build --tag "$NAME:$TAG" "$NAME" \
        1> >(tee "$NAME/stdout.log") \
        2> >(tee "$NAME/stderr.log" >&2)
}

push() {
    NAME=$1
    TAG=$2
    OWNER=$3
    sudo docker tag "$NAME:$TAG" "ghcr.io/$OWNER/$NAME:$TAG"
    sudo docker push "ghcr.io/$OWNER/$NAME:$TAG"
}

pull() {
    NAME=$1
    TAG=$2
    OWNER=$3
    apptainer pull "$NAME.sif" "docker://ghcr.io/$OWNER/$NAME:$TAG"
}

# Pass the arguments
case $1 in
    (build) build "$2" "${3:-"latest"}" ;;
    (push) push "$2" "$3" "$4" ;;
    (pull) pull"$2" "$3" "$4" ;;
    (*) exit 1 ;;
esac

