#### Preamble ####
# Purpose: Loads all raw datasets
# Author: Hyungsoo Park
# Date: 10 April 2024
# Contact: hyungsoo.park@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Load data ####
raw_inflation = read_csv("data/raw_data/INDINF_LOWTARGET,INDINF_UPPTARGET,INDINF_CPI_M-sd-2014-06-29-ed-2024-03-02.csv", skip = 10) # skip first 10 rows that contain description
raw_interest = read_csv("data/raw_data/Candian_Interest_Rate.csv", skip = 10)
raw_nas = read_csv("data/raw_data/NASDAQ_Historical.csv")
raw_btc = read_csv("data/raw_data/BTC-USD.csv")


         
