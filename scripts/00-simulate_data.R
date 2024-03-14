#### Preamble ####
# Purpose: Cleans the two data sets for the years 2018 to 2021
# Author: Navya Hooda, Shivank Goel, Vanshika Vanshika
# Date: 07 March 2024 
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT

library(tidyverse)

# Set seed for reproducibility
set.seed(42)

# Define the simulation parameters
years <- 2018:2022
causes <- c("Heart Disease", "Cancer", "Chronic Respiratory Diseases", "Accidents", "Stroke")
genders <- c("Male", "Female")
age_groups <- c("0-14", "15-44", "45-64", "65+")

# Define the size parameter for the negative binomial distribution to simulate over-dispersion
size_param <- 5

# Simulate the dataset
simulated_data <- expand.grid(year = years, cause = causes, gender = genders, age_group = age_groups) %>%
  mutate(
    # Assume the 'size' parameter as a dispersion factor and 'prob' parameter to vary by cause
    # Adjust 'prob' parameter as per hypothetical base rates for each cause
    deaths = rnbinom(n = n(), size = size_param, prob = case_when(
      cause == "Heart Disease" ~ 0.2,
      cause == "Cancer" ~ 0.15,
      cause == "Chronic Respiratory Diseases" ~ 0.1,
      cause == "Accidents" ~ 0.05,
      cause == "Stroke" ~ 0.05,
      TRUE ~ 0.1
    ))
  )

# Writing the simulated data 
write_csv(simulated_data, "data/analysis_data/simulated_data.csv")