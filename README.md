# ERA5 grids into national and sub-national boundaries worldwide

## Introduction:

[ERA5](https://www.ecmwf.int/en/forecasts/datasets/reanalysis-datasets/era5) provides hourly estimates of a large number of atmospheric, land and oceanic climate variables. The data cover the Earth on a 30km grid and resolve the atmosphere using 137 levels from the surface up to a height of 80km. ERA5 includes information about uncertainties for all variables at reduced spatial and temporal resolutions.

I have converted temperature and potentially other weather variable grids to national and sub-national boundaries for use in several papers.

Available for download (see [Data](#Data) below) in [RDS](https://www.r-bloggers.com/2016/12/remember-to-use-the-rds-format/) (compact) or csv (large) format.

In Python it is [easy to load RDS files](https://stackoverflow.com/questions/40996175/loading-a-rds-file-in-pandas) and much more compact files than csvs too.

Work in progress by Robbie M Parks.

2020...2022... and beyond

## Data

`t2m` - 2-metre temperature

### [1st-order administrative units](https://en.wikipedia.org/wiki/Category:First-level_administrative_divisions_by_country) (ADM1):

[Albania](output/grid_county_intersection_raster/ALB/adm1/) (ALB)\
[Armenia](output/grid_county_intersection_raster/ARM/adm1/) (ARM)\
[Australia](output/grid_county_intersection_raster/AUS/adm1/) (AUS)\
[Austria](output/grid_county_intersection_raster/AUT/adm1/) (AUT)\
[Belgium](output/grid_county_intersection_raster/BEL/adm1/) (BEL)\
[Bulgaria](output/grid_county_intersection_raster/BGR/adm1/) (BGR)\
[Botswana](output/grid_county_intersection_raster/BWA/adm1/) (BWA)\
[Canada](output/grid_county_intersection_raster/CAN/adm1/) (CAN)\
[Switzerland](output/grid_county_intersection_raster/CHE/adm1/) (CHE)\
[Chile](output/grid_county_intersection_raster/CHL/adm1/) (CHL)\
[Cameroon](output/grid_county_intersection_raster/CMR/adm1/) (CMR)\
[Cyprus](output/grid_county_intersection_raster/CYP/adm1/) (CYP)\
[Czech Republic](output/grid_county_intersection_raster/CZE/adm1/) (CZE)\
[Germany](output/grid_county_intersection_raster/DEU/adm1/) (DEU)\
[Denmark](output/grid_county_intersection_raster/DNK/adm1/) (DNK)\
[Spain](output/grid_county_intersection_raster/ESP/adm1/) (ESP)\
[Estonia](output/grid_county_intersection_raster/EST/adm1/) (EST)\
[Ethiopia](output/grid_county_intersection_raster/ETH/adm1/) (ETH)\
[Finland](output/grid_county_intersection_raster/FIN/adm1/) (FIN)\
[France](output/grid_county_intersection_raster/FRA/adm1/) (FRA)\
[United Kingdom](output/grid_county_intersection_raster/GBR/adm1/) (GBR)\
[Georgia](output/grid_county_intersection_raster/GEO/adm1/) (GEO)\
[Ghana](output/grid_county_intersection_raster/GHA/adm1/) (GHA)\
[Greece](output/grid_county_intersection_raster/GRC/adm1/) (GRC)\
[Croatia](output/grid_county_intersection_raster/HRV/adm1/) (HRV)\
[Hungary](output/grid_county_intersection_raster/HUN/adm1/) (HUN)\
[Iceland](output/grid_county_intersection_raster/ISL/adm1/) (ISL)\
[Italy](output/grid_county_intersection_raster/ITA/adm1/) (ITA)\
[Kenya](output/grid_county_intersection_raster/KEN/adm1/) (KEN)\
[Republic of Korea](output/grid_county_intersection_raster/KOR/adm1/) (KOR)\
[Liberia](output/grid_county_intersection_raster/LBR/adm1/) (LBR)\
[Liechtenstein](output/grid_county_intersection_raster/LIE/adm1/) (LIE)\
[Lesotho](output/grid_county_intersection_raster/LSO/adm1/) (LSO)\
[Lithuania](output/grid_county_intersection_raster/LTU/adm1/) (LTU)\
[Luxembourg](output/grid_county_intersection_raster/LUX/adm1/) (LUX)\
[Latvia](output/grid_county_intersection_raster/LVA/adm1/) (LVA)\
[Montenegro](output/grid_county_intersection_raster/MNE/adm1/) (MNE)\
[Malawi](output/grid_county_intersection_raster/MWI/adm1/) (MWI)\
[Nigeria](output/grid_county_intersection_raster/NGA/adm1/) (NGA)\
[Netherlands](output/grid_county_intersection_raster/NLD/adm1/) (NLD)\
[Norway](output/grid_county_intersection_raster/NOR/adm1/) (NOR)\
[New Zealand](output/grid_county_intersection_raster/NZL/adm1/) (NZL)\
[Philippines](output/grid_county_intersection_raster/PHL/adm1) (PHL)\
[Poland](output/grid_county_intersection_raster/POL/adm1/) (POL)\
[Portugal](output/grid_county_intersection_raster/PRT/adm1/) (PRT)\
[Romania](output/grid_county_intersection_raster/ROU/adm1/) (ROU)\
[Rwanda](output/grid_county_intersection_raster/RWA/adm1/) (RWA)\
[Sierra Leone](output/grid_county_intersection_raster/SLE/adm1/) (SLE)\
[Serbia](output/grid_county_intersection_raster/SRB/adm1/) (SRB)\
[Slovakia](output/grid_county_intersection_raster/SVK/adm1/) (SVK)\
[Slovenia](output/grid_county_intersection_raster/SVN/adm1/) (SVN)\
[Sweden](output/grid_county_intersection_raster/SWE/adm1/) (SWE)\
[Taiwan](output/grid_county_intersection_raster/TWN/adm1/) (TWN)\
[Tanzania](output/grid_county_intersection_raster/TZA/adm1/) (TZA)\
[Uganda](output/grid_county_intersection_raster/UGA/adm1/) (UGA)\
[USA](output/grid_county_intersection_raster/USA/adm1/) (USA)\
[South Africa](output/grid_county_intersection_raster/ZAF/adm1/) (ZAF)\
[Zambia](output/grid_county_intersection_raster/ZMB/adm1/) (ZMB)\
[Zimbabwe](output/grid_county_intersection_raster/ZWE/adm1/) (ZWE)

### [2nd-order administrative units](https://en.wikipedia.org/wiki/Category:Second-level_administrative_divisions_by_country) (ADM2):

[Albania](output/grid_county_intersection_raster/ALB/adm2/) (ALB)\
[Australia](output/grid_county_intersection_raster/AUS/adm2/) (AUS)\
[Austria](output/grid_county_intersection_raster/AUT/adm2/) (AUT)\
[Belgium](output/grid_county_intersection_raster/BEL/adm2/) (BEL)\
[Bulgaria](output/grid_county_intersection_raster/BGR/adm2/) (BGR)\
[Botswana](output/grid_county_intersection_raster/BWA/adm2/) (BWA)\
[Canada](output/grid_county_intersection_raster/CAN/adm2/) (CAN)\
[Switzerland](output/grid_county_intersection_raster/CHE/adm2/) (CHE)\
[Chile](output/grid_county_intersection_raster/CHL/adm2/) (CHL)\
[Cameroon](output/grid_county_intersection_raster/CMR/adm2/) (CMR)\
[Czech Republic](output/grid_county_intersection_raster/CZE/adm2/) (CZE)\
[Germany](output/grid_county_intersection_raster/DEU/adm2/) (DEU)\
[Denmark](output/grid_county_intersection_raster/DNK/adm2/) (DNK)\
[Spain](output/grid_county_intersection_raster/ESP/adm2/) (ESP)\
[Estonia](output/grid_county_intersection_raster/EST/adm2/) (EST)\
[Ethiopia](output/grid_county_intersection_raster/ETH/adm2/) (ETH)\
[Finland](output/grid_county_intersection_raster/FIN/adm2/) (FIN)\
[France](output/grid_county_intersection_raster/FRA/adm2/) (FRA)\
[United Kingdom](output/grid_county_intersection_raster/GBR/adm2/) (GBR)\
[Georgia](output/grid_county_intersection_raster/GEO/adm2/) (GEO)\
[Ghana](output/grid_county_intersection_raster/GHA/adm2/) (GHA)\
[Greece](output/grid_county_intersection_raster/GRC/adm2/) (GRC)\
[Croatia](output/grid_county_intersection_raster/HRV/adm2/) (HRV)\
[Hungary](output/grid_county_intersection_raster/HUN/adm2/) (HUN)\
[Iceland](output/grid_county_intersection_raster/ISL/adm2/) (ISL)\
[Italy](output/grid_county_intersection_raster/ITA/adm2/) (ITA)\
[Kenya](output/grid_county_intersection_raster/KEN/adm2/) (KEN)\
[Republic of Korea](output/grid_county_intersection_raster/KOR/adm2/) (KOR)\
[Liberia](output/grid_county_intersection_raster/LBR/adm2/) (LBR)\
[Lithuania](output/grid_county_intersection_raster/LTU/adm2/) (LTU)\
[Luxembourg](output/grid_county_intersection_raster/LUX/adm2/) (LUX)\
[Latvia](output/grid_county_intersection_raster/LVA/adm2/) (LVA)\
[Malawi](output/grid_county_intersection_raster/MWI/adm2/) (MWI)\
[Nigeria](output/grid_county_intersection_raster/NGA/adm2/) (NGA)\
[Netherlands](output/grid_county_intersection_raster/NLD/adm2/) (NLD)\
[Norway](output/grid_county_intersection_raster/NOR/adm2/) (NOR)\
[New Zealand](output/grid_county_intersection_raster/NZL/adm2/) (NZL)\
[Philippines](output/grid_county_intersection_raster/PHL/adm2) (PHL)\
[Poland](output/grid_county_intersection_raster/POL/adm2/) (POL)\
[Portugal](output/grid_county_intersection_raster/PRT/adm2/) (PRT)\
[Romania](output/grid_county_intersection_raster/ROU/adm2/) (ROU)\
[Rwanda](output/grid_county_intersection_raster/RWA/adm2/) (RWA)\
[Sierra Leone](output/grid_county_intersection_raster/SLE/adm2/) (SLE)\
[Serbia](output/grid_county_intersection_raster/SRB/adm2/) (SRB)\
[Slovakia](output/grid_county_intersection_raster/SVK/adm2/) (SVK)\
[Slovenia](output/grid_county_intersection_raster/SVN/adm2/) (SVN)\
[Sweden](output/grid_county_intersection_raster/SWE/adm2/) (SWE)\
[Taiwan](output/grid_county_intersection_raster/TWN/adm2/) (TWN)\
[Tanzania](output/grid_county_intersection_raster/TZA/adm2/) (TZA)\
[Uganda](output/grid_county_intersection_raster/UGA/adm2/) (UGA)\
[USA](output/grid_county_intersection_raster/USA/adm2/) (USA)\
[South Africa](output/grid_county_intersection_raster/ZAF/adm2/) (ZAF)\
[Zambia](output/grid_county_intersection_raster/ZMB/adm2/) (ZMB)\
[Zimbabwe](output/grid_county_intersection_raster/ZWE/adm2/) (ZWE)

Let me know if you'd like me to run any other specific countries, but others in progress.

## Code

### Actual processing functions:

[downloading_netcdf_files_day_sep_era5_cdsapi.py](prog/01_extract_netcdf/downloading_netcdf_files_day_sep_era5_cdsapi.py) - script to download lots of ERA5 files from server\
[processing_code.R](prog/01_extract_netcdf/processing_code.R) - Does the heavy lifting here averaging by national and sub-national boundaries\
[population_grid_summary.R](prog/02_population_grid/population_grid_summary.R)  - Find population weights based on gridded population of world

## Papers using this output

V. Kontis, J.E. Bennett, R.M. Parks, T. Rashid, J. Pearson-Stuttard, P. Asaria, B. Zhou, M. Guillot, C.D. Mathers, Y.H. Khang, M. McKee and M. Ezzati. _Lessons learned and lessons missed: impact of the coronavirus disease 2019 (COVID-19) pandemic on all-cause mortality in 40 industrialised countries prior to mass vaccination._ Wellcome Open Research 2021, 6:279
([paper](https://wellcomeopenresearch.org/articles/6-279)) ([code](https://github.com/vkontis/excess_mortality/tree/pub2)). 

V. Kontis, J.E. Bennett, T. Rashid, R.M. Parks, J. Pearson-Stuttard, M. Guillot, P. Asaria, B. Zhou, M. Battaglini, G. Corsetti, M. McKee, M. Di Cesare, C. D. Mathers and M. Ezzati. _Magnitude, demographics and dynamics of the effect of the first wave of the COVID-19 pandemic on all-cause mortality in 21 industrialized countries._ Nature Medicine 26, 1919–1928 (2020) ([paper](https://www.nature.com/articles/s41591-020-1112-0)) ([code](https://github.com/vkontis/excess_mortality/tree/pub)).
