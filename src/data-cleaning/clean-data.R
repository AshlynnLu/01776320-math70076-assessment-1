# Import packages
library(dplyr)

# Load raw data
data_raw <- read.csv("~/Desktop/MSc/spring/DS/01776320-math70076-assessment-1/data/raw/Marijuana_Sales_By_County_2014_To_Date_Report_County_Report.csv",
                 skip = 4, header = TRUE)
data_raw <- data_raw[1:5035, ]

# Rename the header
colnames(data_raw) <- c("Month", "Year", "County", "Medical", "Retail")

# Make the Month and Year variable into integer
# Create a new variable which include both Year and Month information
data_raw <- data_raw %>%
  mutate(Month = sprintf("%02d", as.integer(Month)),
         Year = as.integer(Year),
         Year_Month = as.Date(paste(Year, Month, "01", sep = "-")))

# Remove the leading space in front "Total"
data_raw$County[data_raw$County == " Total"] <- "Total"

# Transform the sales into integer
data <- data_raw %>%
  mutate(Medical = ifelse(Medical != "NR" & !is.na(Medical),
                          as.integer(gsub("\\$|,", "", Medical)),
                          Medical))
data <- data_raw %>%
  mutate(Retail = ifelse(Retail != "NR" & !is.na(Retail),
                         as.integer(gsub("\\$|,", "", Retail)),
                         Retail))
# Remove NR and NA
data_non_NR_NA <- data_raw %>%
  filter(Medical != "NR" & !is.na(Medical) & Retail != "NR" & !is.na(Retail)) %>%
  mutate(Medical = as.integer(gsub("\\$|,", "", Medical)),
         Retail = as.integer(gsub("\\$|,", "", Retail)))

save(data_non_NR_NA, file = "data_non_NR_NA.RData")

# Total sale
data_total_sale <- data_non_NR_NA %>%
  filter(County == 'Total') %>%
  mutate(Total_Sale = Medical + Retail) %>%
  select(-County)

# County data
data_county <- data_non_NR_NA %>%
  filter(County != 'Total') %>%
  mutate(Total_Sale = Medical + Retail)


