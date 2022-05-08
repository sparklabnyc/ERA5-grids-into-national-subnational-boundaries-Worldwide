rm(list=ls())

# declare root directory, folder locations and load essential stuff
project.folder = paste0(print(here::here()),'/')

# arguments from Rscript
args <- commandArgs(trailingOnly=TRUE)

# names for files
year <- as.numeric(args[1])
dname <- 't2m'
freq <- 'daily'
num <- 'four'
space.res <- '1'
country.id <- 'SWE'

# process from grids into shapefiles
source('countries/Worldwide/prog/01_extract_netcdf/processing_code.R')
