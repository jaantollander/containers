FROM ubuntu:20.04

ENV PATH="/usr/local/bin:$PATH"

# DEBIAN_FRONTEND=noninteractive apt-get install -yq r-base libhdf5-dev libhdf5-103-1 libxml2-dev libssl-dev libcurl4-openssl-dev && \
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq r-base libhdf5-dev libxml2-dev libssl-dev libcurl4-openssl-dev libfontconfig1-dev libgit2-dev libzmq3-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev build-essential && \
    echo "install.packages('pacman', repos='http://cran.us.r-project.org')" | Rscript --vanilla  - && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "install.packages('BiocManager', repos='http://cran.us.r-project.org')" | Rscript --vanilla  - && \
    echo "install.packages('usethis')" | Rscript  - && \
    echo "install.packages('devtools')" | Rscript  - && \
    echo 'devtools::install_version("RcppAnnoy", version = "0.0.16", repos="http://cran.us.r-project.org") ' | Rscript --vanilla  - && \
    echo 'BiocManager::install("BiocNeighbors")' | Rscript --vanilla - && \
    echo 'devtools::install_version("RcppAnnoy", version = "0.0.18", repos="http://cran.us.r-project.org") ' | Rscript --vanilla  - && \
    echo 'BiocManager::install("SingleR")' | Rscript --vanilla - && \
    echo 'BiocManager::install("limma")' | Rscript --vanilla - && \
    echo 'BiocManager::install("SingleCellExperiment")' | Rscript --vanilla - && \
    echo "devtools::install_version(package = 'rsvd', version = package_version('1.0.2'), repos = 'http://cran.us.r-project.org')" | Rscript --vanilla - && \
    echo "devtools::install_version(package = 'Seurat', version = package_version('3.2.3'), repos = 'http://cran.us.r-project.org')" | Rscript --vanilla - && \
    echo "install.packages('https://cran.r-project.org/src/contrib/Archive/spatstat/spatstat_1.64-1.tar.gz', repos=NULL,type='source', INSTALL_opts = '--no-lock')" | Rscript --vanilla - && \
    echo "devtools::install_version(package = 'Seurat', version = package_version('3.2.3'), repos = 'http://cran.us.r-project.org',dependencies = F)" | Rscript --vanilla - && \
    echo 'list.p=c("dplyr","Matrix","future","pheatmap","ggplot2","optparse","hdf5r");pacman::p_load(list.p, character.only = TRUE)' | Rscript --vanilla -

# ENTRYPOINT /bin/bash
