#### Preamble ####
# Purpose: Cleans the two data sets for the years 2018 to 2021
# Author: Navya Gupta, Shivank Goel, Vanshika Vanshika
# Date: 07 March 2024 
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(xlsx)
library(janitor)
library(readxl)
library(dplyr)

#### Clean data ####

#death-by-gender-and-age data
    
file_path <- "data/raw_data/deaths-by-gender-and-age.csv"
# Extracting 2018 data from death-by-gender-and-age data
death_age_gender_2018 <- read.csv(file_path, skip = 19319, nrows = 20538 - 19320)
# Extracting 2019 data from death-by-gender-and-age data
death_age_gender_2019 <- read.csv(file_path, skip = 20538, nrows = 21380 - 20539)
# Extracting 2020 data from death-by-gender-and-age data
death_age_gender_2020 <- read.csv(file_path, skip = 21380, nrows = 22656 - 21381)
# Extracting 2021 data from death-by-gender-and-age data
death_age_gender_2021 <- read.csv(file_path, skip = 22656, nrows = 23864 - 22657)
# Extracting 2022 data from death-by-gender-and-age data
death_age_gender_2022 <- read.csv(file_path, skip = 23864, nrows = 25176 - 23865)

# death-leading-causes-data

# extracting 2018 data from death-leading-causes-data
death_causes_2018 = read.xlsx("data/raw_data/deaths-leading-causes.xlsx", "Sheet1", rowIndex = 516:545)
# extracting 2019 data from death-by-gender-and-age data
death_causes_2019 = read.xlsx("data/raw_data/deaths-leading-causes.xlsx", "Sheet1", rowIndex = 546:575)
# extracting 2020 data from death-by-gender-and-age data
death_causes_2020 = read.xlsx("data/raw_data/deaths-leading-causes.xlsx", "Sheet1", rowIndex = 576:605)
# extracting 2021 data from death-by-gender-and-age data
death_causes_2021 = read.xlsx("data/raw_data/deaths-leading-causes.xlsx", "Sheet1", rowIndex = 606:635)
# extracting 2022 data from death-by-gender-and-age data
death_causes_2022 = read.xlsx("data/raw_data/deaths-leading-causes.xlsx", "Sheet1", rowIndex = 637:666)

# Assigning column names for death-by-gender-and-age data
column_names <- c("Calendar Year", "Cause", "Gender", "Age_0_4", "Age_5_9", "Age_10_14", "Age_15_19", "Age_20_24", 
                  "Age_25_29", "Age_30_34", "Age_35_39", "Age_40_44", "Age_45_49", "Age_50_54", "Age_55_59", 
                  "Age_60_64", "Age_65_69", "Age_70_74", "Age_75_79", "Age_80_84", "Age_85_89", "Age_90_plus", 
                  "NS", "Res Total", "Non Res Total", "Grand Total")

colnames(death_age_gender_2018) <- column_names
colnames(death_age_gender_2019) <- column_names
colnames(death_age_gender_2020) <- column_names
colnames(death_age_gender_2021) <- column_names
colnames(death_age_gender_2022) <- column_names

# Assigning column names for death-leading-causes-data

death_causes_column_names <- c("Calendar Year", "Cause", "Ranking", "Total Deaths")

colnames(death_causes_2018) <- death_causes_column_names
colnames(death_causes_2019) <- death_causes_column_names
colnames(death_causes_2020) <- death_causes_column_names
colnames(death_causes_2021) <- death_causes_column_names
colnames(death_causes_2022) <- death_causes_column_names

# Simplifying names
death_age_gender_2018 = clean_names(death_age_gender_2018)
death_age_gender_2019 = clean_names(death_age_gender_2019)
death_age_gender_2020 = clean_names(death_age_gender_2020)
death_age_gender_2021 = clean_names(death_age_gender_2021)
death_age_gender_2022 = clean_names(death_age_gender_2022)
death_causes_2018 = clean_names(death_causes_2018)
death_causes_2019 = clean_names(death_causes_2019)
death_causes_2020 = clean_names(death_causes_2020)
death_causes_2021 = clean_names(death_causes_2021)
death_causes_2022 = clean_names(death_causes_2022)

##columns of interest
death_age_gender_2018 = 
  death_age_gender_2018 |>
  select(
    calendar_year, cause, gender,
    age_0_4, age_5_9,
    age_10_14, age_15_19,
    age_20_24, age_25_29,
    age_30_34, age_40_44,
    age_45_49, age_50_54,
    age_60_64, age_65_69,
    age_70_74, age_75_79,
    age_80_84, age_85_89,
    age_90_plus, grand_total)

death_age_gender_2019 = 
  death_age_gender_2019 |>
  select(
    calendar_year, cause, gender,
    age_0_4, age_5_9,
    age_10_14, age_15_19,
    age_20_24, age_25_29,
    age_30_34, age_40_44,
    age_45_49, age_50_54,
    age_60_64, age_65_69,
    age_70_74, age_75_79,
    age_80_84, age_85_89,
    age_90_plus, grand_total)


death_age_gender_2020 = 
  death_age_gender_2020 |>
  select(
    calendar_year, cause, gender,
    age_0_4, age_5_9,
    age_10_14, age_15_19,
    age_20_24, age_25_29,
    age_30_34, age_40_44,
    age_45_49, age_50_54,
    age_60_64, age_65_69,
    age_70_74, age_75_79,
    age_80_84, age_85_89,
    age_90_plus, grand_total)


death_age_gender_2021 = 
  death_age_gender_2021 |>
  select(
    calendar_year, cause, gender,
    age_0_4, age_5_9,
    age_10_14, age_15_19,
    age_20_24, age_25_29,
    age_30_34, age_40_44,
    age_45_49, age_50_54,
    age_60_64, age_65_69,
    age_70_74, age_75_79,
    age_80_84, age_85_89,
    age_90_plus, grand_total)

death_age_gender_2022 = 
  death_age_gender_2022 |>
  select(
    calendar_year, cause, gender,
    age_0_4, age_5_9,
    age_10_14, age_15_19,
    age_20_24, age_25_29,
    age_30_34, age_40_44,
    age_45_49, age_50_54,
    age_60_64, age_65_69,
    age_70_74, age_75_79,
    age_80_84, age_85_89,
    age_90_plus, grand_total)



#### Save data ####
write_csv(death_age_gender_2018, "data/analysis_data/death_cause_by_gender_age/2018.csv")
write_csv(death_age_gender_2019, "data/analysis_data/death_cause_by_gender_age/2019.csv")
write_csv(death_age_gender_2020, "data/analysis_data/death_cause_by_gender_age/2020.csv")
write_csv(death_age_gender_2021, "data/analysis_data/death_cause_by_gender_age/2021.csv")
write_csv(death_age_gender_2022, "data/analysis_data/death_cause_by_gender_age/2022.csv")

write_csv(death_causes_2018, "data/analysis_data/death_causes/2018.csv")
write_csv(death_causes_2019, "data/analysis_data/death_causes/2019.csv")
write_csv(death_causes_2020, "data/analysis_data/death_causes/2020.csv")
write_csv(death_causes_2021, "data/analysis_data/death_causes/2021.csv")
write_csv(death_causes_2022, "data/analysis_data/death_causes/2022.csv")




### Extra cleaning ###
# Read the CSV file
data <- read.csv(file_path, skip = 2, stringsAsFactors = FALSE)

# Remove rows with "Total" as cause
data <- data[!grepl("Total", data$Cause), ]

# Reshape the data
library(tidyr)
cleaned_data <- pivot_longer(data, starts_with("0-"), names_to = "Age_Group", values_to = "Deaths")

# Extract gender from Cause column and remove it from Cause
cleaned_data$Gender <- sub(".*\\s", "", cleaned_data$Cause)
cleaned_data$Cause <- sub("\\s\\S+$", "", cleaned_data$Cause)


# Print cleaned dataset
print(cleaned_data)

