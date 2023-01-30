FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get --quiet update && \
    apt-get install --assume-yes --no-install-recommends \
        build-essential \
        flex \
        bison \
        git \
        r-base \
        libxml2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        python3 \
        python3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --branch "v2.4.1" \
        https://github.com/sysbio-curie/MaBoSS-env-2.0.git \
        /usr/local/src/maboss && \
    rm -rf /usr/local/src/maboss/.git && \
    (cd /usr/local/src/maboss/engine/src && make && make install ;) && \
    ln -s /usr/local/src/maboss/engine/pub/* /usr/local/bin

# TODO: fix the version of the repo
# TODO: do we want to link the directory or files in it?
# TODO: remove the need for seq
# TODO: better name than myproj
RUN git clone https://github.com/vincent-noel/COVID19.git \
        /usr/local/src/covid19 && \
    rm -rf /usr/local/src/covid19/.git && \
    (cd /usr/local/src/covid19/PhysiCell && sed -i 's/COVID19/myproj/g' Makefile && make ;) && \
    ln -s /usr/local/src/covid19/PhysiCell/myproj /usr/local/bin/myproj

RUN RPKGS1="install.packages('pacman', repos='http://cran.us.r-project.org')" && \
    RPKGS2='pacman::p_load(c("dplyr","tidyverse","diptest","mclust","moments","pheatmap","optparse"), character.only = TRUE)' && \
    Rscript --vanilla -e "$RPKGS1" && \
    Rscript --vanilla -e "$RPKGS2"

#RUN echo "install.packages('pacman', repos='http://cran.us.r-project.org')" | Rscript --vanilla  - && \
#    echo 'pacman::p_load(c("dplyr","tidyverse","diptest","mclust","moments","pheatmap","optparse"), character.only = TRUE)' | Rscript --vanilla -
