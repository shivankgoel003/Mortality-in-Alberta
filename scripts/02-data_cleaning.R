#### Preamble ####
# Purpose: Cleans the two data sets for the years 2018 to 2021
# Author: Navya Gupta, Shivank Goel, Vanshika Vanshika
# Date: 07 March 2024 
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(xlsx)

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

