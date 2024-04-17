#### Preamble ####
# Purpose: Cleans the raw data sets (Daily, Montly) to Quarter data set
# Author: Hyungsoo Park
# Date: 13 April 2024
# Contact: Hyungsoo Park
# License: MIT

#### Workspace setup ####
library(tidyverse)

raw_inflation = read_csv("data/raw_data/INDINF_LOWTARGET,INDINF_UPPTARGET,INDINF_CPI_M-sd-2014-06-29-ed-2024-03-02.csv", skip = 10) # skip first 10 rows that contain description
raw_interest = read_csv("data/raw_data/Candian_Interest_Rate.csv", skip = 10)
raw_nas = read_csv("data/raw_data/NASDAQ_Historical.csv")
raw_btc = read_csv("data/raw_data/BTC-USD.csv")

# Chnage Daily data to Quarter data
quar_nas = read_csv("data/raw_data/NASDAQ_Historical.csv")
quar_nas$Date <- ymd(quar_nas$Date)
quar_nas$Quarter <- paste0(year(quar_nas$Date), " Q", quarter(quar_nas$Date))

cleaned_nas <- quar_nas |>
  group_by(Quarter) |>
  summarise(NASDAQ_close = mean(Close)) |>
  slice(-n()) |>
  slice(-n())

# Write csv
write_csv(cleaned_nas, "data/analysis_data/cleaned_nas.csv")

# Change Daily data to Quarter data
quar_btc = read_csv("data/raw_data/BTC-USD.csv")
quar_btc$Date <- ymd(quar_btc$Date)
quar_btc$Quarter <- paste0(year(quar_btc$Date), " Q", quarter(quar_btc$Date))

cleaned_btc <- quar_btc |>
  group_by(Quarter) |>
  summarise(Bitcoin_close = mean(Close)) |>
  slice(-n()) |>
  slice(-n())

# Write cleaned inflation data set
write_csv(cleaned_nas, "data/analysis_data/cleaned_btc.csv")

# Clean Inflation rate dataset
quar_inflation = read_csv("data/raw_data/INDINF_LOWTARGET,INDINF_UPPTARGET,INDINF_CPI_M-sd-2014-06-29-ed-2024-03-02.csv", skip = 10) # skip first 10 rows that contain description
quar_inflation$date <- ymd(quar_inflation$date)
quar_inflation$Quarter <- paste0(year(quar_inflation$date), " Q", quarter(quar_inflation$date))

cleaned_inflation <- quar_inflation |>
  group_by(Quarter) |>
  summarise(Inflation = mean(INDINF_CPI_M)) |>
  slice(-n())

# Write cleaned inflation data set
write_csv(cleaned_inflation, "data/analysis_data/cleaned_inflation.csv")

# Clean Interest rate dataset
quar_interest = read_csv("data/raw_data/Candian_Interest_Rate.csv", skip = 10)
quar_interest$Date <- ym(quar_interest$Date)
quar_interest$Quarter <- paste0(year(quar_interest$Date), " Q", quarter(quar_interest$Date))

cleaned_interest <- quar_interest |>
  group_by(Quarter) |>
  summarise(Interest = mean(V122530)) |>
  slice(-c(1, n()))

# Write cleaned inflation data set
write_csv(cleaned_interest, "data/analysis_data/cleaned_interest.csv")

# Combine all dataset
all_cleaned <- cleaned_inflation |>
  inner_join(cleaned_interest, by = "Quarter") |>
  inner_join(cleaned_nas, by = "Quarter") |>
  inner_join(cleaned_btc, by = "Quarter")

# Write combined cleaned data set
write_csv(all_cleaned, "data/analysis_data/all_cleaned.csv")