FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get --quiet update && \
    apt-get install --assume-yes --no-install-recommends \
        r-base \
        default-jre \
        python3 \
        python3-pip \
        wget \
        unzip && \
    rm -rf /var/lib/apt/lists/*

# TODO: specify versions to install
RUN pip install maboss seaborn && \
    wget --no-hsts --quiet https://github.com/sysbio-curie/MaBoSS-env-2.0/releases/download/v2.4.1/MaBoSS-linux64.zip && \
    unzip -o MaBoSS-linux64.zip -d /usr/local/bin/ && \
    rm MaBoSS-linux64.zip
