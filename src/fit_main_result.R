#!/usr/bin/env Rscript
#install.packages("rstan")
install.packages("readr")
library(readr)
source('run_mcmc.R')


# load data
north_carolina <- read_tsv(file = '../data/north_carolina.tsv')

# run and save threshold results
output = run_mcmc(north_carolina, '../output/main_result', iter = 5000, chains = 5)

