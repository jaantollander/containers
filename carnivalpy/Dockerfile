FROM ubuntu:22.04

# TODO: add conda via mamba?

ENV export LD_LIBRARY_PATH="/opt/env/:$LD_LIBRARY_PATH"

COPY ./scripts/carnivalpy.sh /opt/carnivalpy.sh
COPY ./carnivalpy /opt/carnivalpy
COPY ./scripts/export.R /opt/export.R
COPY ./scripts/feature_merge.py /opt/feature_merge.py
COPY ./env.yml /opt/env.yml

RUN ln -sf /opt/feature_merge.py /usr/local/bin/feature_merger

# TODO: conda install -f env.yml
