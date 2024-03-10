#### Preamble ####
# Purpose: Cleans the two data sets for the years 2018 to 2021
# Author: Navya Gupta, Shivank Goel, Vanshika Vanshika
# Date: 07 March 2024 
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(readxl)
library(dplyr)

#### Clean data ####
# first dataset
df <- read_csv("data/raw_data/deaths-leading-causes.csv", skip = 2)

# Filter the data to include only rows where the Cause is "Acute myocardial infarction" or "Malignant neoplasms of trachea, bronchus and lung"
filtered_df <- df[df$Cause %in% c("Acute myocardial infarction", "Malignant neoplasms of trachea, bronchus and lung"), ]

# Select only the necessary columns: Year, Cause, Ranking, and Total Deaths
cleaned_df <- filtered_df[, c("Calendar Year", "Cause", "Ranking", "Total Deaths")]

# Rename the columns
colnames(cleaned_df) <- c("Year", "Cause", "Ranking", "Total Deaths")

# Write the cleaned data to a new CSV file
write_csv(cleaned_df, "data/analysis_data/cleaned_file.csv")

