rm(list=ls())

# declare root directory, folder locations and load essential stuff
project.folder = paste0(print(here::here()),'/')

# arguments from Rscript
args <- commandArgs(trailingOnly=TRUE)
seed.arg <- as.numeric(args[1])

# create grid of years an countries
source(paste0(project.folder,'data/objects/objects.R'))
seed.grid = expand.grid(year=years_total,countries=countries)
chosen.row <- seed.grid[seed.arg,]

# names for files
year <- as.numeric(chosen.row[1,1])
dname <- 't2m'
freq <- 'daily'
num <- 'four'
space.res <- '0'
country.id <- as.character(chosen.row[1,2])

# process from grids into shapefiles
source(paste0(project.folder,'prog/01_extract_netcdf/processing_code.R'))
