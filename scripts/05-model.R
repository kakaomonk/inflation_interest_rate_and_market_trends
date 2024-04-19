#### Preamble ####
# Purpose: Models of NASDAQ index and cryptocurrecy (Bitcoin) price.
# Author: Hyungsoo Park
# Date: 10 April 2024
# Contact: hyungsoo.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
cleaned_data <- read_parquet("data/analysis_data/all_cleaned.parquet")

#### Model data for NASDAQ Index ####
nas_model <- 
  stan_glm(
    formula = NASDAQ_close ~ Inflation + Interest,
    data = cleaned_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 1002415488
  )

#### Save model ####
saveRDS(
  nas_model,
  file = "models/nas_model.rds"
)

#### Model data for Bitcoin ####
nas_model <- 
  stan_glm(
    formula = Bitcoin_close ~ Inflation + Interest,
    data = cleaned_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 1002415488
  )

#### Save model ####
saveRDS(
  nas_model,
  file = "models/bitcoin_model.rds"
)
