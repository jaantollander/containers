FROM ubuntu:22.04

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        software-properties-common && \
    add-apt-repository universe && \
    apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        g++ \
        gcc \
        make \
        cmake \
        mpich \
        libhdf5-dev && \
    rm -rf /var/lib/apt/lists/*

COPY ./tar/carnival.tar.gz /opt/carnival.tar.gz
COPY ./tar/cellnopt.tar.gz /opt/cellnopt.tar.gz

RUN tar -xvf /opt/carnival.tar.gz -C /opt/. && \
    rm /opt/carnival.tar.gz && \
    tar -xvf /opt/cellnopt.tar.gz -C /opt/. && \
    rm /opt/cellnopt.tar.gz && \
    (cd /opt/cellnopt && make example1; ) && \
    (cd /opt/carnival && make aco_toymodel && make aco_carnival; ) && \
    ln -sf /opt/cellnopt/build/example1 /usr/local/bin && \
    ln -sf /opt/carnival/build/aco /usr/local/bin

