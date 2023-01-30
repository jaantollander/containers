FROM ubuntu:20.04

ENV PATH="/usr/local/bin:$PATH"

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq build-essential flex bison git r-base  libxml2-dev libssl-dev libcurl4-openssl-dev python3 python3-dev && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
	  mkdir -p /usr/local/scm/ && \
	  cd /usr/local/scm/ && \
    (git clone https://github.com/sysbio-curie/MaBoSS-env-2.0.git -b v2.4.1; cd MaBoSS-env-2.0/engine/src; make && make install) && \
    (cd /usr/local/bin; ln -s /usr/local/scm/MaBoSS-env-2.0/engine/pub/* .) && \
    (git clone https://github.com/vincent-noel/COVID19.git; cd COVID19/PhysiCell; sed -i 's/COVID19/myproj/g' Makefile; make; ln -s /usr/local/scm/COVID19/PhysiCell/myproj /usr/local/bin/myproj) && \
    ls -l /usr/local/bin/myproj && \
    ls -l /usr/local/scm/COVID19/PhysiCell/myproj && \
    echo "install.packages('pacman', repos='http://cran.us.r-project.org')" | Rscript --vanilla  - && \
    echo 'pacman::p_load(c("dplyr","tidyverse","diptest","mclust","moments","pheatmap","optparse"), character.only = TRUE)' | Rscript --vanilla -

# ENTRYPOINT /usr/local/bin/myproj