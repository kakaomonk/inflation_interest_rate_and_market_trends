#### Preamble ####
# Purpose: Tests the cleaned dataset
# Author: Hyungsoo Park
# Date: 10 April 2024
# Contact: hyungsoo.park@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Test data ####
all_cleaned = read_parquet(here("data/analysis_data/all_cleaned.parquet"))


is.character(all_cleaned$Quarter[1:38])
is.numeric(all_cleaned$Inflation[1:38])
is.numeric(all_cleaned$Interest[1:38])
is.numeric(all_cleaned$NASDAQ_close[1:38])
is.numeric(all_cleaned$Bitcoin_close[1:38])
is.Date(all_cleaned$Date[1:38])