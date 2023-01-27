FROM ubuntu:20.04

ENV PATH="/usr/local/bin:$PATH"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y r-base default-jre python3 python3-pip wget unzip && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install maboss seaborn && \
    wget https://github.com/sysbio-curie/MaBoSS-env-2.0/releases/download/v2.4.1/MaBoSS-linux64.zip && \
    unzip -o MaBoSS-linux64.zip -d /usr/local/bin/ && \
    ls -al /usr/local/bin

# ENTRYPOINT /bin/bash
