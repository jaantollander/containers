FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get --quiet update && \
    apt-get install --assume-yes --no-install-recommends \
        r-base \
        libhdf5-dev \
        libxml2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        libfontconfig1-dev \
        libgit2-dev \
        libzmq3-dev \
        libharfbuzz-dev \
        libfribidi-dev \
        libfreetype6-dev \
        libpng-dev \
        libtiff5-dev \
        libjpeg-dev \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

# TODO: can we improve this?
RUN Rscript --vanilla -e "install.packages('pacman', repos='http://cran.us.r-project.org')" && \
    Rscript --vanilla -e "install.packages('BiocManager', repos='http://cran.us.r-project.org')" && \
    Rscript -e "install.packages('usethis')" && \
    Rscript -e "install.packages('devtools')" && \
    Rscript --vanilla -e 'devtools::install_version("RcppAnnoy", version = "0.0.16", repos="http://cran.us.r-project.org") ' && \
    Rscript --vanilla -e 'BiocManager::install("BiocNeighbors")' && \
    Rscript --vanilla -e 'devtools::install_version("RcppAnnoy", version = "0.0.18", repos="http://cran.us.r-project.org") ' && \
    Rscript --vanilla -e 'BiocManager::install("SingleR")' && \
    Rscript --vanilla -e 'BiocManager::install("limma")' && \
    Rscript --vanilla -e 'BiocManager::install("SingleCellExperiment")' && \
    Rscript --vanilla -e "devtools::install_version(package = 'rsvd', version = package_version('1.0.2'), repos = 'http://cran.us.r-project.org')" && \
    Rscript --vanilla -e "devtools::install_version(package = 'Seurat', version = package_version('3.2.3'), repos = 'http://cran.us.r-project.org')" && \
    Rscript --vanilla -e "install.packages('https://cran.r-project.org/src/contrib/Archive/spatstat/spatstat_1.64-1.tar.gz', repos=NULL,type='source', INSTALL_opts = '--no-lock')" && \
    Rscript --vanilla -e "devtools::install_version(package = 'Seurat', version = package_version('3.2.3'), repos = 'http://cran.us.r-project.org',dependencies = F)" && \
    Rscript --vanilla -e 'list.p=c("dplyr","Matrix","future","pheatmap","ggplot2","optparse","hdf5r");pacman::p_load(list.p, character.only = TRUE)'
