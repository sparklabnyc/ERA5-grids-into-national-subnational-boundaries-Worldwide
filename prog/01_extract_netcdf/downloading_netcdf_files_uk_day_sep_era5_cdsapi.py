#!/usr/bin/env python

import cdsapi
import os
import sys
import pandas as pd
from datetime import date, timedelta

print(sys.argv)

args = sys.argv

start_day = pd.to_numeric(args[1])
start_month = pd.to_numeric(args[2])
start_year = pd.to_numeric(args[3])
end_day = pd.to_numeric(args[4])
end_month = pd.to_numeric(args[5])
end_year = pd.to_numeric(args[6])
dname = args[7]

# create list of dates
def date_range(start, end):
    r = (end+timedelta(days=1)-start).days
    return [start+timedelta(days=i) for i in range(r)]


start = date(start_year, start_month, start_day)
end = date(end_year,end_month,end_day)

# if you want to test out by printing out all the dates
# print('\n'.join([str(date) for date in dateList]))

param_dic = {'t2m': '2m_temperature', 'd2m': 'XX'}

# define metrics to download
param = param_dic[dname]

# define directory to place files
home = os.getenv("HOME")
path = home + '/data/climate/net_cdf/' + dname + '/raw_era5_daily/'

# check if file directory exists
if not os.path.exists(path):
    os.makedirs(path)

# change directory to desired file location
os.chdir(path)


def retrieve_era5_worldwide_sep_onevar(start, end):
    """
       A function to demonstrate how to iterate efficiently over several years and months etc
       for a particular interim_request.
    """
    dateList = date_range(start, end)
    for date in dateList:
        year = str(date.year)
        
        path_year = path + year + '/'
        
        # check if file directory exists
        if not os.path.exists(path_year):
            os.makedirs(path_year)

        # change directory to desired file location
        os.chdir(path_year)
        
        date = str(date)
        target = "worldwide_" + dname + "_daily_four_" + date + ".nc"
        era5_request_worldwide(date, target)


def era5_request_worldwide(date, target):
    """
        An ERA5 request from server.
    """
    c = cdsapi.Client()
    year = str(date)[:4]
    month = str(date)[5:7]
    day = str(date)[8:10]
    c.retrieve(
        'reanalysis-era5-single-levels',
        {
            'product_type': 'reanalysis',
            'variable': param,
            'year': year,
            'month': month,
            'day': day,
            'time': [
                '00:00', '06:00', '12:00',
                '18:00'
            ],
            'format': 'netcdf'
        },
        target)


if __name__ == '__main__':
    retrieve_era5_worldwide_sep_onevar(start, end)
