#!/usr/bin/env bash
IMAGES_DIR=${IMAGES_DIR:-"./images"}

build() {
    NAME=$1
    TAG=$2
    sudo docker build --tag "$NAME:$TAG" "$NAME"
}

push() {
    NAME=$1
    TAG=$2
    OWNER=$3
    sudo docker tag "$NAME:$TAG" "ghcr.io/$OWNER/$NAME:$TAG"
    sudo docker push "ghcr.io/$OWNER/$NAME:$TAG"
}

build_oci() {
    NAME=$1
    TAG=$2
    buildah build --tag "$NAME:$TAG" "$NAME"
}

push_oci() {
    NAME=$1
    TAG=$2
    OWNER=$3
    buildah tag "$NAME:$TAG" "ghcr.io/$OWNER/$NAME:$TAG"
    buildah push "ghcr.io/$OWNER/$NAME:$TAG"
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
    (build_oci) build_oci "$2" "${3:-"latest"}" ;;
    (push_oci) push_oci "$2" "$3" "$4" ;;
    (*) exit 1 ;;
esac

