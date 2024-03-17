#!/usr/bin/R
# Universitat Potsdam
# Author Gaurav Sablok
# date: 2024-3-17
library(stringr)
suppressPackageStartupMessages(library(Biostrings, pos = "package:base"))
calculatepattern <- function(file_fasta, type_pattern)
    # a function to calculate certain patterns in long reads
    # using the stringr package. This function can be run in 
    # parallel using the library(parallel) in R. It gives the 
    # count of the occurences which can be easily plotted in R
    # to use calculatestretch(file_fasta = 
    # "./test_check.fasta", type_pattern = "TTTTTT")
    {
    fasta = readDNAStringSet(file_fasta)
    pattern = as.character(type_pattern)
    store_fasta <- vector(length = length(fasta))
    for (i in seq_along(fasta))
    {
        store_fasta[i] <- as.character(fasta[i])
    }
    seq_count <- vector(length = length(fasta))
    for (i in seq_along(store_fasta))
    {
        seq_count[i] <- str_count(store_fasta[i], pattern)
    }
    return(seq_count)

}
