FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get --quiet update && \
    apt-get install --assume-yes --no-install-recommends \
        r-base \
        libhdf5-dev \
        libxml2-dev \
        libssl-dev \
        libcurl4-openssl-dev && \
    rm -rf /var/lib/apt/lists/*

RUN Rscript --vanilla -e "install.packages('pacman', repos='http://cran.us.r-project.org')" && \
    Rscript -e "install.packages('devtools')" && \
    Rscript --vanilla -e 'list.p=c("dplyr","Matrix","future","pheatmap","ggplot2","optparse","hdf5r");pacman::p_load(list.p, character.only = TRUE)' && \
    Rscript -e "install.packages('rmatio')" && \
    Rscript -e "install.packages('XML')"
