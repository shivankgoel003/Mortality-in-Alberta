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
data_average <- read.csv(here("data/analysis_data/cleaned_chart_data.csv"))
data_peak <- read.csv(here("data/analysis_data/cleaned_peak_data.csv"))

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

## model for concentrations


# # Fit negative binomial regression model using stan_glm
# negative_binomial_model <- stan_glm(total_deaths ~ provincial_average, 
#                                     data = data, 
#                                     family = neg_binomial_2(), 
#                                     seed = 123)
# 
# # Summary of the model
# summary(negative_binomial_model)

# Fit negative binomial regression model
negative_binomial_model <- glm.nb(total_deaths ~ provincial_average, data = data_average)

# Summary of the model
summary(negative_binomial_model)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)
saveRDS(poisson_model,
        file = "models/poisson_model.rds" )
saveRDS(causes_model,
        file = "models/causes_model.rds" )
saveRDS(negative_binomial_model,
        file = "models/p_average_model.rds" )


