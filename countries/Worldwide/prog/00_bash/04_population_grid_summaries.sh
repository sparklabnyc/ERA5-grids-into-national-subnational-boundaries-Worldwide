#!/bin/bash

# this script
# identifies overlap between administrative regions and population grids and outputs administrative summaries
# shapefiles downloaded from
# http://www.diva-gis.org/gdata

clear

# arguments for running script
declare -a years=("2010")
declare -a countries=("ALB" "ARM" "AUT" "AUS" "BEL" "BGR" "CAN" "CHE" "CHL" "CYP"
                      "CZE" "DEU" "DNK" "ESP" "EST" "FIN" "FRA" "GBR" "GEO" "GRC"
                      "HRV" "HUN" "ISL" "ITA" "KOR" "LIE" "LTU" "LVA" "LUX" "MLT"
                      "MNE" "NLD" "NOR" "NZL" "POL" "PRT" "ROU" "SRB" "SVK" "SVN"
                      "SWE" "TWN" "USA")
# declare -a countries=() # if new countries
declare -i year_pop=2010
declare -a admin_levels=("0" "1")

#################################################
# POPULATION GRID SUMMARY
#################################################

for year in "${years[@]}"; do
for country in "${countries[@]}"; do
for admin_level in "${admin_levels[@]}"; do

echo "Calculating populations by admin units";

:
# identifies the overlap between grids and administrative codes and creates weighted means
Rscript ~/git/climate/countries/Worldwide/prog/03_population_grid/population_grid_summary.R $year $admin_level $country &

done; done; done;