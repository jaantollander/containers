FROM ubuntu:22.04

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        r-base \
        default-jre \
        python3 \
        python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /usr/bin/python3 /usr/bin/python

RUN pip3 install --no-cache-dir \
        seaborn \
        numpy \
        matplotlib \
        pyyaml \
        permedcoe

# TODO: install print_drug_results building block
