rm(list=ls())

# declare root directory, folder locations and load essential stuff
project.folder = paste0(print(here::here()),'/')

# create grid of years an countries
source(paste0(project.folder,'data/objects/objects.R'))

# names for files
year <- '2022'
dname <- 't2m'
freq <- 'daily'
num <- 'four'
space.res <- '2'
country.id <- 'NUTS'

# create directory to place output files into
dir.output = paste0(project.folder,"output/grid_county_intersection_raster/",country.id,'/adm',space.res,'/')

library(dplyr)

weighted.area.national.total = readRDS(paste0(dir.output,
                                               'weighted_area_raster_',country.id,'_',space.res,'_',dname,'_',freq,'_',as.character(year),'.rds')) %>%
  mutate(date=as.Date((date)))
  
library(ggplot2)

ggplot(weighted.area.national.total) + 
  geom_line(aes(x=date,y=t2m,color=NAME_2)) + 
  ggtitle('2-metre temperature at 6pm local time by region of UK in 2022') + 
  ylab('2-metre temperature (°C)') +
  xlab('Date') +
  theme_bw() + 
  theme(text = element_text(size = 15),
        panel.grid.major = element_blank(),axis.text.x = element_text(angle=90), axis.text.y = element_text(size=12),
        plot.title = element_text(hjust = 0.5),panel.background = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black"),strip.background = element_blank(),
        legend.position = 'none',legend.justification='center',
        legend.background = element_rect(fill="white", size=.5, linetype="dotted"))
  
