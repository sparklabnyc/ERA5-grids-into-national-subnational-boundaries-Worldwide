# Finding weekly long-term averages
# and anomalies based on long-term averages

rm(list=ls())

library(maptools)
library(mapproj)
library(rgeos)
library(rgdal)
library(RColorBrewer)
library(ggplot2)
library(raster)
library(sp)
library(plyr)

# arguments from Rscript
args = commandArgs(trailingOnly=TRUE)

# names for files
year = as.character(args[1])
space.res = as.character(args[2])
country.id = as.character(args[3])

# for code testing
# year = '2010' ; space.res='1' ; country.id = 'FRA'

# create directory to place output files into
dir.output = paste0("../../output/population_grid_summary/",country.id,'/adm',space.res,'/')
ifelse(!dir.exists(dir.output), dir.create(dir.output, recursive=TRUE), FALSE)

# shapefiles downloaded from
# http://www.diva-gis.org/gdata

# load shapefile of chosen country
shapefile <- readOGR(dsn=paste0("~/data/climate/shapefiles/",country.id,"_adm"),layer=paste0(country.id,"_adm",space.res))

# transform into WSG84 (via https://rpubs.com/nickbearman/r-google-map-making)
shapefile = sp::spTransform(shapefile, CRS("+init=epsg:4326"))

# get projection of shapefile
original.proj = proj4string(shapefile)

print(paste0('running population_grid_summary.R for ',country.id,' ',space.res,' ',year))

# function to perform analysis for entire country
country.analysis = function(shapefile,raster.input,output=0) {

    # dataframe with values for each region for particular day
    weighted.area = round(extract(x=raster.input,y=shapefile,fun=sum,df=TRUE,na.rm=TRUE))

    # fix names
    names(weighted.area) = c(paste0('ID_',space.res),paste0('population_',year))

    return(weighted.area)

}

# load raster for relevant date and change co-ordinates to -180 to 180
# via https://rpubs.com/markpayne/358146
raster.current = paste0("~/data/climate/population_gridded/",year,'/gpw-v4-basic-demographic-characteristics-rev11_bt_cntm_15_min_nc/gpw_v4_basic_demographic_characteristics_rev11_bt_',year,'_cntm_15_min.nc')

# perform analysis
raster.full = brick(raster.current)

# top layer is total population
raster.full = raster.full[[1]]

# projet to be the same as the chosen country map
raster.full = projectRaster(raster.full, crs=original.proj)

# for testing only
# plot(raster.full) ; plot(shapefile, add=TRUE)

# perform analysis
weighted.area.national =  country.analysis(shapefile,raster.full)

# get lookup for names
name.lookup = shapefile@data
# names = get(paste0('name.lookup$NAME_',space.res))
names = name.lookup[,which(colnames(name.lookup)==paste0('NAME_',space.res))]

# add names to summary file
weighted.area.national = cbind(weighted.area.national, names)
names(weighted.area.national)[3] = paste0('NAME_',space.res)

# rearrange to sensible order of columns
weighted.area.national = weighted.area.national[,c(1,3,2)]

# save file
saveRDS(weighted.area.national,paste0(dir.output,'population_',country.id,'_',space.res,'_',as.character(year),'.rds'))
write.csv(weighted.area.national,paste0(dir.output,'population_',country.id,'_',space.res,'_',as.character(year),'.csv'),row.names=FALSE)
