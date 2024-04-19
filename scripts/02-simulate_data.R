#### Preamble ####
# Purpose: Simulates the data
# Author: Hyungsoo Park
# Date: 10 April 2024
# Contact: hyungsoo.park@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

# set seed
set.seed(1002415488)

# number of simulations
num_sim = 10000

# simulate
simulate_market = tibble(
  Inflation = rnorm(num_sim, 1, 1),
  Interest = rnorm(num_sim, 1, 1),
  NASDAQ = rnorm(num_sim, 15000, 100),
  Bitcoin = rnorm(num_sim, 60000, 400),
)