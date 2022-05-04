# ERA5 grids into national and sub-national boundaries worldwide

## Introduction:

[ERA5](https://www.ecmwf.int/en/forecasts/datasets/reanalysis-datasets/era5) provides hourly estimates of a large number of atmospheric, land and oceanic climate variables. The data cover the Earth on a 30km grid and resolve the atmosphere using 137 levels from the surface up to a height of 80km. ERA5 includes information about uncertainties for all variables at reduced spatial and temporal resolutions.

I have converted temperature and potentially other weather variable grids to national and sub-national boundaries for use in several papers.

Available for download (see [Data](#Data) below) in [RDS](https://www.r-bloggers.com/2016/12/remember-to-use-the-rds-format/) (compact) or csv (large) format.

In Python it is [easy to load RDS files](https://stackoverflow.com/questions/40996175/loading-a-rds-file-in-pandas) and much more compact files than csvs too.

Work in progress by Robbie M Parks.

2020...2022... and beyond

## Data

Countries covered:

Albania (ALB)\
Armenia (ARM)\
Australia (AUS)\
Austria (AUT)\
Belgium (BEL)\
Bulgaria (BGR)\
Botswana (BWA)\
Canada (CAN)\
Switzerland (CHE)\
Chile (CHL)\
Cameroon (CMR)\
Cyprus (CYP)\
Czech Republic (CZE)\
Germany (DEU)\
Denmark (DNK)\
Spain (ESP)\
Estonia (EST)\
Ethiopia (ETH)\
Finland (FIN)\
France (FRA)\
United Kingdom (GBR)\
Georgia (GEO)\
Ghana (GHA)\
Greece (GRC)\
Croatia (HRV)\
Hungary (HUN)\
Iceland (ISL)\
Italy (ITA)\
Kenya (KEN)\
Republic of Korea (KOR)\
Liberia (LBR)\
Liechtenstein (LIE)\
Lithuania (LTU)\
Lesotho (LSO)\
Luxembourg (LUX)\
Latvia (LVA)\
Malta (MLT)\
Montenegro (MNE)\
Malawi (MWI)\
Nigeria (NGA)\
Netherlands (NLD)\
Norway (NOR)\
New Zealand (NZL)\
Poland (POL)\
Portugal (PRT)\
Romania (ROU)\
Rwanda (RWA)\
Sierra Leone (SLE)\
Serbia (SRB)\
Slovakia (SVK)\
Slovenia (SVN)\
Sweden (SWE)\
Taiwan (TWN)\
Tanzania (TZA)\
Uganda (UGA)\
# USA (USA)\
South Africa (ZAF)\
Zambia (ZMB)\
Zimbabwe (ZWE)

Let me know if you'd like me to run any other specific countries, but others in progress.

## Code

### Bash files:

01_netcdf_download.sh                   - Download netcdf files for ERA5 by day for chosen years\
02_grid_county_intersection_raster.sh   - Area-weighted averages for each unit in a country\
04_population_grid_summaries.sh         - For population-weighting up to national level from sub-unit values

### Actual processing functions:

01_extract_netcf/downloading_netcdf_files_uk_day_sep_era5_cdsapi.py - script to download lots of ERA5 files from server\
01_extract_netcf/extracting_netcdf_files_era5.R - Does the heavy lifting here averaging by political sub-units\
03_population_grid/population_grid_summary.R  - Find population weights based on gridded population of world

## Papers using this output

V. Kontis, J.E. Bennett, R.M. Parks, T. Rashid, J. Pearson-Stuttard, P. Asaria, B. Zhou, M. Guillot, C.D. Mathers, Y.H. Khang, M. McKee and M. Ezzati. _Lessons learned and lessons missed: impact of the coronavirus disease 2019 (COVID-19) pandemic on all-cause mortality in 40 industrialised countries prior to mass vaccination._ Wellcome Open Research 2021, 6:279
([paper](https://wellcomeopenresearch.org/articles/6-279)) ([code](https://github.com/vkontis/excess_mortality/tree/pub2)). 

V. Kontis, J.E. Bennett, T. Rashid, R.M. Parks, J. Pearson-Stuttard, M. Guillot, P. Asaria, B. Zhou, M. Battaglini, G. Corsetti, M. McKee, M. Di Cesare, C. D. Mathers and M. Ezzati. _Magnitude, demographics and dynamics of the effect of the first wave of the COVID-19 pandemic on all-cause mortality in 21 industrialized countries._ Nature Medicine 26, 1919–1928 (2020) ([paper](https://www.nature.com/articles/s41591-020-1112-0)) ([code](https://github.com/vkontis/excess_mortality/tree/pub)).
