FROM ubuntu:20.04

COPY install.R /opt/install.R

COPY scripts/tf_enrichment.R /usr/local/bin/tf_enrichment
    scripts/progeny.R /usr/local/bin/progeny
    scripts/preprocess.R /usr/local/bin/preprocess
    scripts/export.R /usr/local/bin/export
    scripts/normalize.R /usr/local/bin/normalize
    scripts/omnipath.R /usr/local/bin/omnipath
    scripts/export_carnival.R /usr/local/bin/export_carnival
    scripts/carnivalr.R /usr/local/bin/carnivalr

RUN chmod +x /usr/local/bin/*.R

ENV export LC_ALL=C
    export R_LIBS="/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library"

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        wget \
        build-essential \
        software-properties-common \
        dirmngr \
        gnupg \
        apt-transport-https \
        ca-certificates \
        r-base \
        r-base-dev
        libcurl4-openssl-dev \
        libxml2-dev \
        libssl-dev \
        libpng-dev \
        git && \
    rm -rf /var/lib/apt/lists/* && \

RUN Rscript --vanilla /opt/install.R
