FROM ubuntu:20.04

COPY install.R /opt/install.R
COPY scripts/*.R /opt/toolset/

ENV export LC_ALL=C
    export R_LIBS="/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library"

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        wget \
        build-essential \
        software-properties-common \
        dirmngr \
        gnupg \
        apt-transport-https \
        ca-certificates \
        r-base \
        r-base-dev
        libcurl4-openssl-dev \
        libxml2-dev \
        libssl-dev \
        libpng-dev \
        git && \
    rm -rf /var/lib/apt/lists/* && \

RUN chmod +x /opt/install.R /opt/toolset/*.R && \
    /opt/install.R && \
    ln -sf /opt/toolset/* /usr/local/bin
