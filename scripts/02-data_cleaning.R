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
df1 <- read.csv("data/raw_data/deaths-leading-causes.csv", skip = 2)
# Filter the data to include only rows where the Cause is "Acute myocardial infarction" or "Malignant neoplasms of trachea, bronchus and lung"
filtered_df <- df[df$Cause %in% c("Acute myocardial infarction", "Malignant neoplasms of trachea, bronchus and lung", "Other chronic obstructive pulmonary disease", "All other forms of chronic ischemic heart disease"), ]

# Select only the necessary columns: Year, Cause, Ranking, and Total Deaths
cleaned_df <- filtered_df[, c("Calendar Year", "Cause", "Ranking", "Total Deaths")]

# Rename the columns
colnames(cleaned_df) <- c("Year", "Cause", "Ranking", "Total Deaths")

cleaned_df <- cleaned_df %>%
  filter(`Year` >= 2012)
cleaned_df = clean_names(cleaned_df)

# Write the cleaned data to a new CSV file
write_csv(cleaned_df, "data/analysis_data/cleaned_file.csv")


## Other dataset ##

data <- read_csv("data/raw_data/download.csv")

# Select only the necessary columns and rename them
cleaned_data <- data[, c("CSD", "Period", "Air Quality Health Index", "Health Risk", "OriginalValue")]
# Rename the columns
cleaned_data <- cleaned_data %>%
  rename(Municipality = CSD,
         Year = Period)

cleaned_data <- cleaned_data %>%
  arrange(Year)
cleaned_data <- cleaned_data %>%
  filter(`Year` >= 2012)

cleaned_data = clean_names(cleaned_data)

# Save the cleaned dataset to a CSV file
write.csv(cleaned_data, file = "data/analysis_data/cleaned_air_data.csv", row.names = FALSE)


## extra dataset ##



# Filter the data to include only rows where the Cause is "Acute myocardial infarction" or "Malignant neoplasms of trachea, bronchus and lung"
filtered_df <- df[df$Cause %in% c("Malignant neoplasms of trachea, bronchus and lung"), ]

# Select only the necessary columns: Year, Cause, Ranking, and Total Deaths
cleaned_df <- filtered_df[, c("Calendar Year", "Cause", "Ranking", "Total Deaths")]

# Rename the columns
colnames(cleaned_df) <- c("Year", "Cause", "Ranking", "Total Deaths")
cleaned_df <- cleaned_df %>%
  filter(`Year` < 2022)
cleaned_df = clean_names(cleaned_df)

chart <- read.csv("data/raw_data/chart.csv")

names(chart)[1] <- "year"
# Select only the necessary columns: Year, Cause, Ranking, and Total Deaths
chart <- chart [, c("year", "Provincial.Average")]
chart <- chart %>%
  filter(`year` >= 2001)
chart = clean_names(chart)

# Merge datasets based on the year column
merged_data <- merge(cleaned_df, chart, by.x = "year", by.y = "year", all.x = TRUE)

# Save the cleaned dataset to a CSV file
write.csv(merged_data, file = "data/analysis_data/cleaned_chart_data.csv", row.names = FALSE)


## P2.5 PEAK GRAPHS

chart <- read.csv("data/raw_data/ppeak.csv")

names(chart)[1] <- "year"
# Select only the necessary columns: Year, Cause, Ranking, and Total Deaths
chart <- chart [, c("year", "Provincial.Average")]
chart <- chart %>%
  filter(`year` >= 2001)
chart = clean_names(chart)

# Merge datasets based on the year column
merged_data <- merge(cleaned_df, chart, by.x = "year", by.y = "year", all.x = TRUE)

# Save the cleaned dataset to a CSV file
write.csv(merged_data, file = "data/analysis_data/cleaned_peak_data.csv", row.names = FALSE)

