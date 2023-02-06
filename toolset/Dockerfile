FROM ubuntu:20.04

ENV export LC_ALL=C
ENV export R_LIBS="/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library"

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        ca-certificates \
        wget \
        gnupg \
        build-essential \
        git \
        libcurl4-openssl-dev \
        libxml2-dev \
        libssl-dev \
        libpng-dev && \
    rm -rf /var/lib/apt/lists/*

# Install latest r-base.
# https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html
# TODO: Verify that the key fingerprint is:
# E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | \
        tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc && \
    echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" | \
        tee -a /etc/apt/sources.list.d/focal_cran40.list && \
    apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        r-base \
        r-base-dev && \
    rm -rf /var/lib/apt/lists/*

COPY ./install.R /opt/install.R
RUN Rscript --vanilla /opt/install.R

COPY ./scripts/tf_enrichment.R /usr/local/bin/tf_enrichment
COPY ./scripts/progeny.R /usr/local/bin/progeny
COPY ./scripts/preprocess.R /usr/local/bin/preprocess
COPY ./scripts/export.R /usr/local/bin/export
COPY ./scripts/normalize.R /usr/local/bin/normalize
COPY ./scripts/omnipath.R /usr/local/bin/omnipath
COPY ./scripts/export_carnival.R /usr/local/bin/export_carnival
COPY ./scripts/carnivalr.R /usr/local/bin/carnivalr
RUN chmod +x /usr/local/bin/*
