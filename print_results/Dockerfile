FROM ubuntu:20.04

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        r-base \
        default-jre \
        python3 \
        python3-pip && \
    ln -sf /usr/bin/python3 /usr/bin/python

RUN pip install --no-cache-dir \
        seaborn \
        numpy \
        matplotlib \
        pyyaml \
        permedcoe

# TODO: install print_drug_results building block
