#!/usr/bin/env Rscript --vanilla
install.packages('pacman', repos='http://cran.us.r-project.org')
install.packages('devtools')
list.p=c("dplyr","Matrix","future","pheatmap","ggplot2","optparse","hdf5r")
pacman::p_load(list.p, character.only = TRUE)
install.packages('rmatio')
install.packages('XML')
