FROM ubuntu:20.04

ENV PATH="/usr/local/bin:$PATH"

#DEBIAN_FRONTEND=noninteractive apt-get install -yq r-base libhdf5-dev libhdf5-103-1 libxml2-dev libssl-dev libcurl4-openssl-dev
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq r-base libhdf5-dev libxml2-dev libssl-dev libcurl4-openssl-dev && \
    echo "install.packages('pacman', repos='http://cran.us.r-project.org')" | Rscript --vanilla  - && \
    echo "install.packages('devtools')" | Rscript  - && \
    echo 'list.p=c("dplyr","Matrix","future","pheatmap","ggplot2","optparse","hdf5r");pacman::p_load(list.p, character.only = TRUE)' | Rscript --vanilla - && \
    echo "install.packages('rmatio')" | Rscript  - && \
    echo "install.packages('XML')" | Rscript  -

# ENTRYPOINT /bin/bash
