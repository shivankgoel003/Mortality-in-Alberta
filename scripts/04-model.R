#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
deaths_data <- read.csv(here("data/analysis_data/cleaned_file.csv"))
air_quality_data <- read.csv(here("data/analysis_data/cleaned_air_data.csv"))


### Model data ####
# first_model <-
#   stan_glm(
#     formula = flying_time ~ length + width,
#     data = analysis_data,
#     family = gaussian(),
#     prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
#     prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
#     prior_aux = exponential(rate = 1, autoscale = TRUE),
#     seed = 853
#   )

# 
# merged_data <- merge(air_quality_data, deaths_data, by = "year")  # Adjust the common key as needed
# 
# print(merged_data)
# # Fit negative binomial regression model
# total_deaths_model_neg_binomial <- stan_glm(
#   total_deaths ~ original_value + cause,
#   data = merged_data,
#   family = neg_binomial_2(link = "log"),
#   seed = 123  # Set your desired seed value
# )
library(tidyverse)
library(readr)
library(MASS)

# Convert year and air_quality_health_index to numeric
data <- air_quality_data %>%
  mutate(year = as.numeric(year),
         air_quality_health_index = as.numeric(air_quality_health_index))

# Fit negative binomial regression model
first_model <- glm.nb(air_quality_health_index ~ year, data = data)


# Fit Poisson regression model
poisson_model <- glm(air_quality_health_index ~ year, data = data, family = poisson())

# For the four causes and total deaths
# Assuming the dataset for causes and total deaths is named 'causes_data'

causes_model <- glm.nb(total_deaths ~ year + cause, data = deaths_data)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)
saveRDS(poisson_model,
        file = "models/poisson_model.rds" )
saveRDS(causes_model,
        file = "models/causes_model.rds" )

