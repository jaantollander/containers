#!/usr/bin/env bash
IMAGES_DIR="images"

build() {
    NAME=$1
    TAG=$2
    DATE=$(date -u +"%Y-%m-%d_%H:%M:%S")
    LOG_DIR="$NAME/.logs/$DATE"
    mkdir -p "$LOG_DIR"
    sudo docker build --tag "$NAME:$TAG" "$NAME" \
        1> >(tee "$LOG_DIR/stdout.log") \
        2> >(tee "$LOG_DIR/stderr.log" >&2)
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
    mkdir -p "$IMAGES_DIR"
    apptainer pull "$IMAGES_DIR/$NAME.sif" "docker://ghcr.io/$OWNER/$NAME:$TAG"
}

# Pass the arguments
case $1 in
    (build) build "$2" "${3:-"latest"}" ;;
    (push) push "$2" "$3" "$4" ;;
    (pull) pull "$2" "$3" "$4" ;;
    (*) exit 1 ;;
esac

