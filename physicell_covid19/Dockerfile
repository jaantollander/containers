FROM ubuntu:22.04

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        build-essential \
        flex \
        bison \
        git \
        gcc \
        g++ \
        make \
        r-base \
        libxml2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        python3 \
        python3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --branch "v2.4.1" \
        https://github.com/sysbio-curie/MaBoSS-env-2.0.git \
        /usr/local/src/maboss && \
    rm -rf /usr/local/src/maboss/.git && \
    (cd /usr/local/src/maboss/engine/src && make && make install ;) && \
    ln -sf /usr/local/src/maboss/engine/pub/* /usr/local/bin

# TODO: fix the version of the repo
# TODO: do we want to link the directory or files in it?
# TODO: remove the need for seq
# TODO: better name than myproj
# TODO: point to specific commit hash
RUN git clone https://github.com/vincent-noel/COVID19.git \
        /usr/local/src/covid19 && \
    rm -rf /usr/local/src/covid19/.git && \
    (cd /usr/local/src/covid19/PhysiCell && sed -i 's/COVID19/myproj/g' Makefile && make ;) && \
    ln -sf /usr/local/src/covid19/PhysiCell/myproj /usr/local/bin/myproj

COPY ./install.R /opt/install.R
RUN Rscript --vanilla /opt/install.R
