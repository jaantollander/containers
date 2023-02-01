FROM ubuntu:20.04

COPY scripts/tf_enrichment.R /usr/local/bin/tf_enrichment
COPY scripts/progeny.R /usr/local/bin/progeny
COPY scripts/preprocess.R /usr/local/bin/preprocess
COPY scripts/export.R /usr/local/bin/export
COPY scripts/normalize.R /usr/local/bin/normalize
COPY scripts/omnipath.R /usr/local/bin/omnipath
COPY scripts/export_carnival.R /usr/local/bin/export_carnival
COPY scripts/carnivalr.R /usr/local/bin/carnivalr

RUN chmod +x /usr/local/bin/*

ENV export LC_ALL=C
ENV export R_LIBS="/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library"

# TODO: install r-base version greater than 4.0
RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        ca-certificates \
        build-essential \
        git \
        r-base \
        r-base-dev \
        libcurl4-openssl-dev \
        libxml2-dev \
        libssl-dev \
        libpng-dev && \
    rm -rf /var/lib/apt/lists/*

COPY install.R /opt/install.R
RUN Rscript --vanilla /opt/install.R
