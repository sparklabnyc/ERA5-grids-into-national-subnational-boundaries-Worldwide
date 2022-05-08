#!/bin/bash

# this script
# identifies overlap between administrative regions and temperature grids and outputs administrative summaries
# shapefiles downloaded from
# http://www.diva-gis.org/gdata

clear

# arguments for running script

# if updating 2021
declare -a countries=("ALB" "ARM" "AUT" "AUS" "BEL" "BGR" "CAN" "CHE" "CHL" "CYP"
                      "CZE" "DEU" "DNK" "ESP" "EST" "FIN" "FRA" "GBR" "GEO" "GRC"
                      "HRV" "HUN" "ISL" "ITA" "KOR" "LIE" "LTU" "LVA" "LUX" "MLT"
                      "MNE" "NLD" "NOR" "NZL" "POL" "PRT" "ROU" "SRB" "SVK" "SVN"
                      "SWE" "TWN" "USA")
declare -a years=($(seq 2021 2021))
declare -a admin_levels=("1")

# if new country and need 2010 to 2020 (by default should be commented out)
# declare -a countries=()
# declare -a years=($(seq 2010 2020))
# declare -a admin_levels=("1")

# if want other levels of admin (by default should be commented out)
##declare -a admin_levels=("0" "2")

# For France national for time series lecture (by default should be commented out)
# declare -a countries=("FRA")
# declare -a years=($(seq 1980 2021))
# declare -a admin_levels=("0")

# For Africa children hospital study (by default should be commented out)
#declare -a countries=("AFR")
#declare -a years=($(seq 2010 2019))
#declare -a admin_levels=("3")

declare -a dnames=("t2m")
declare -a times=("daily")
declare -a nums=("four")

#################################################
# WEIGHTED MEAN CALCULATION
#################################################

for country in "${countries[@]}"; do
for year in "${years[@]}"; do
for dname in "${dnames[@]}"; do
for time in "${times[@]}"; do
for num in "${nums[@]}"; do
for admin_level in "${admin_levels[@]}"; do

echo "Identifying overlap between rasters and admin codes for temperature processing";

:
# identifies the overlap between grids and administrative codes and creates weighted means
Rscript ~/git/ERA5-grids-into-national-subnational-boundaries-Worldwide/countries/Worldwide/prog/01_extract_netcdf/extracting_netcdf_files_era5.R $year $dname $time $num $admin_level $country &

done; done; done; done; done; done;

# # and for UK too! (slightly different as by LAD specifically)
# 
# declare -a spaces=("lad")
# 
# for year in "${years[@]}"; do
# for dname in "${dnames[@]}"; do
# for time in "${times[@]}"; do
# for num in "${nums[@]}"; do
# for space in "${spaces[@]}"; do
# 
# echo "Identifying overlap between rasters and LADs codes for temperature processing";
# echo $year;
# 
# :
# # identifies the overlap between grids and LADs codes and creates weighted means
# Rscript ~/git/climate/countries/UK/prog/01_extract_netcdf/extracting_netcdf_files_era5.R $year $dname $time $num $space &
# 
# done; done; done; done; done;
