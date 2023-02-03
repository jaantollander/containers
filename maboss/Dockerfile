FROM ubuntu:20.04

# ASL 2.0 license
# https://b2drop.bsc.es/index.php/s/SRWPNAkKL73oaRw/download
COPY ./jar/BiNoM.jar /usr/local/jar/BiNoM.jar

# TODO: license compatibility issues?
# LGPL-3.0 license
# https://github.com/auranic/VDAOEngine/raw/master/jar/VDAOEngine.jar
COPY ./jar/VDAOEngine.jar /usr/local/jar/VDAOEngine.jar

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        r-base \
        default-jre \
        default-jdk \
        git \
        flex \
        bison \
        python3 \
        python3-pip \
        wget \
        gcc \
        g++ \
        make && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /usr/bin/python3 /usr/bin/python

RUN git clone --branch "v2.4.1" \
        https://github.com/sysbio-curie/MaBoSS-env-2.0.git \
        /usr/local/src/maboss && \
    rm -rf /usr/local/src/maboss/.git && \
    (cd /usr/local/src/maboss/engine/src && make && make install ;) && \
    ln -sf /usr/local/src/maboss/engine/pub/* /usr/local/bin
