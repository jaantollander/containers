FROM ubuntu:20.04

RUN apt-get update > /dev/null && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --yes \
        r-base default-jre default-jdk git flex bison python-is-python3 pip wget gcc g++ make > /dev/null && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --branch "v2.4.1" \
        https://github.com/sysbio-curie/MaBoSS-env-2.0.git \
        /usr/local/src/maboss && \
    rm -rf /usr/local/src/maboss/.git && \
    (cd /usr/local/src/maboss/engine/src && make && make install ;) && \
    ln -s /usr/local/src/maboss/engine/pub/* /usr/local/bin

RUN mkdir -p /usr/local/jar && \
    wget --no-hsts --quiet \
        https://b2drop.bsc.es/index.php/s/SRWPNAkKL73oaRw/download \
        -O /usr/local/jar/BiNoM.jar && \
    wget --no-hsts --quiet \
        https://github.com/auranic/VDAOEngine/raw/master/jar/VDAOEngine.jar \
        -O /usr/local/jar/VDAOEngine.jar
