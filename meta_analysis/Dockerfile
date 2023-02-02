FROM ubuntu:20.04

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        r-base \
        libhdf5-dev \
        libxml2-dev \
        libssl-dev \
        libcurl4-openssl-dev && \
    rm -rf /var/lib/apt/lists/*

COPY ./install.R /opt/install.R
RUN Rscript --vanilla /opt/install.R
