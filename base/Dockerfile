FROM ubuntu:22.04

ENV export LC_ALL=C
ENV export R_LIBS="/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library"

# Install common packages and R
RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        "ca-certificates" \
        "wget" \
        "bzip2" \
        "git" \
        "r-base=4.1.*" \
        "r-base-dev=4.1.*" \
        "libhdf5-dev=1.10.*" \
        "libxml2-dev=2.9.*" \
        "libgit2-dev=1.1.*" \
        "libssl-dev=3.0.*" \
        "libcurl4-openssl-dev=7.81.*" \
        "libpng-dev=1.6.*" && \
    rm -rf /var/lib/apt/lists/*

# TODO: Should we install the latest R?
# https://cloud.r-project.org/bin/linux/ubuntu/

# Install miniforge and mamba
# https://github.com/conda-forge/miniforge-images
ARG MINIFORGE_NAME=Mambaforge
ARG MINIFORGE_VERSION=22.11.1-4
#ARG TARGETPLATFORM

ENV CONDA_DIR=/opt/conda
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH=${CONDA_DIR}/bin:${PATH}

RUN wget --no-hsts --quiet "https://github.com/conda-forge/miniforge/releases/download/${MINIFORGE_VERSION}/${MINIFORGE_NAME}-${MINIFORGE_VERSION}-Linux-$(uname -m).sh" \
        -O /tmp/miniforge.sh && \
    /bin/bash /tmp/miniforge.sh -b -p ${CONDA_DIR} && \
    rm /tmp/miniforge.sh && \
    conda clean --tarballs --index-cache --packages --yes && \
    find ${CONDA_DIR} -follow -type f -name '*.a' -delete && \
    find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete && \
    conda clean --force-pkgs-dirs --all --yes  && \
    echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate base" >> /etc/skel/.bashrc && \
    echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate base" >> ~/.bashrc

