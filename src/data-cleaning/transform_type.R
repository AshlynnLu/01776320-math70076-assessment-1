library(dplyr)

# Load raw data
data <- read.csv("~/Desktop/MSc/spring/DS/01776320-math70076-assessment-1/data/raw/Marijuana_Sales_By_County_2014_To_Date_Report_County_Report.csv",
                 skip = 4, header = TRUE)
data <- data[1:5035, ]

# Rename the header
colnames(data) <- c("Month", "Year", "County", "Medical", "Retail")

# Transform the sales into integer
data <- data %>%
  mutate(Medical = ifelse(Medical != "NR" & !is.na(Medical),
                          as.integer(gsub("\\$|,", "", Medical)),
                          Medical))
data <- data %>%
  mutate(Retail = ifelse(Retail != "NR" & !is.na(Retail),
                          as.integer(gsub("\\$|,", "", Retail)),
                          Retail))


