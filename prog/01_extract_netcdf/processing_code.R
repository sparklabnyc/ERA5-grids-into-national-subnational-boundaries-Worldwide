library(maptools)
library(mapproj)
library(rgeos)
library(rgdal)
library(RColorBrewer)
library(ggplot2)
library(raster)
library(sp)
library(plyr)

# exception for Malta and other small countries
if(country.id=='MLT'){space.res="0"}

# create directory to place output files into
dir.output = paste0(project.folder,"output/grid_county_intersection_raster/",country.id,'/adm',space.res,'/')
ifelse(!dir.exists(dir.output), dir.create(dir.output, recursive=TRUE), FALSE)

# shapefiles downloaded from
# http://www.diva-gis.org/gdata

# load shapefile of chosen country
shapefile <- readOGR(dsn=paste0("~/data/climate/shapefiles/",country.id,"_adm"),layer=paste0(country.id,"_adm",space.res))

# transform into WSG84 (via https://rpubs.com/nickbearman/r-google-map-making)
# shapefile <- sp::spTransform(shapefile, sp::CRS("+init=epsg:4326"))

# get projection of shapefile
original.proj = proj4string(shapefile)

print(paste0('running extracting_netcdf_files.R for ',country.id,' ',space.res,' ',year))

# perform analysis across every day of selected year
# loop through each raster file for each day and summarise
dates = seq(as.Date(paste0('0101',year),format="%d%m%Y"), as.Date(paste0('3112',year),format="%d%m%Y"), by=1)
dates = as.character(dates)

# function to perform analysis for entire country
country.analysis = function(shapefile,raster.input,output=0) {

    # dataframe with values for each region for particular day
    weighted.area = extract(x=raster.input,weights = TRUE,normalizeWeights=TRUE,y=shapefile,fun=mean,df=TRUE,na.rm=TRUE)

    # convert to centigrade
    weighted.area$layer = round((weighted.area$layer - 273.15),2)
    names(weighted.area) = c(paste0('ID_',space.res),dname)

    return(weighted.area)

}

# get lookup for names
name.lookup = shapefile@data
# names = get(paste0('name.lookup$NAME_',space.res))
names = name.lookup[,which(colnames(name.lookup)==paste0('NAME_',space.res))]

# empty dataframe to load summarised national daily values into
weighted.area.national.total = data.frame()

# loop through each day of the year and perform analysis
print(paste0('Processing dates in ',year))
for(date in dates){

    # load raster for relevant date and change co-ordinates to -180 to 180
    raster.current = paste0('~/data/climate/net_cdf/',dname,'/raw_era5_daily/','worldwide_',dname,'_',freq,'_',num,'_',as.character(date),'.nc')

    if(file.exists(raster.current)){

        print(as.character(date))

        raster.full <- raster(raster.current)
        raster.full <- rotate(raster.full)

        # projet to be the same as the chosen country map
        raster.full = projectRaster(raster.full, crs=original.proj)

        # flatten the raster's x values per day
        raster.full <- calc(raster.full, fun = mean)

        # for testing only
        # plot(raster.full)

        # create empty dataframe to fill with zip code summary information
        weighted.area.national = data.frame()

        # perform analysis
        analysis.dummy =  country.analysis(shapefile,raster.full)
        analysis.dummy$date = format(as.Date(date), "%Y-%m-%d")
        analysis.dummy = cbind(analysis.dummy,names)
        weighted.area.national = rbind(weighted.area.national,analysis.dummy)

        weighted.area.national = weighted.area.national[,c(3,1,4,2)]
        weighted.area.national.total = data.table::rbindlist(list(weighted.area.national.total,weighted.area.national))
    }
    if(!(file.exists(raster.current))){
        print(paste0(as.character(date),' : file not found'))
    }
}

names(weighted.area.national.total)[3] = paste0('NAME_',space.res)

# save file
saveRDS(weighted.area.national.total,paste0(dir.output,
                                            'weighted_area_raster_',country.id,'_',space.res,'_',dname,'_',freq,'_',as.character(year),'.rds'))
write.csv(weighted.area.national.total,paste0(dir.output,
                                              'weighted_area_raster_',country.id,'_',space.res,'_',dname,'_',freq,'_',as.character(year),'.csv'),row.names = F)
