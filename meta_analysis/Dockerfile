FROM ubuntu:22.04

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        "gcc=4:11.*" \
        "g++=4:11.*" \
        "make=4.*" \
        "r-base=4.1.*" \
        "libhdf5-dev=1.10.*" \
        "libxml2-dev=2.9.*" \
        "libgit2-dev=1.1.*" \
        "libssl-dev=3.0.*" \
        "libcurl4-openssl-dev=7.81.*" && \
    rm -rf /var/lib/apt/lists/*

COPY ./install.R /opt/install.R
RUN Rscript --vanilla /opt/install.R
