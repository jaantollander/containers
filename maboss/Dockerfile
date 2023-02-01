FROM ubuntu:20.04

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

RUN mkdir -p /usr/local/jar && \
    wget --no-hsts --quiet \
        https://b2drop.bsc.es/index.php/s/SRWPNAkKL73oaRw/download \
        -O /usr/local/jar/BiNoM.jar && \
    wget --no-hsts --quiet \
        https://github.com/auranic/VDAOEngine/raw/master/jar/VDAOEngine.jar \
        -O /usr/local/jar/VDAOEngine.jar
