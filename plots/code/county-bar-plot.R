library(ggplot2)
library(grid)
library(ggnewscale)
library(ggtext)
library(tidyverse)
library(shadowtext)
library(patchwork)

#data_non_NR_NA <- readRDS(data_non_NR_NA)

source("CMYK_to_hexadecimal.R")

line_color1 <- CMYK_to_hexadecimal(90, 50, 15, 5)
line_color2 <- CMYK_to_hexadecimal(67, 0, 18, 0)
line_color3 <- CMYK_to_hexadecimal(12, 30, 70, 0)

line_labels <- data.frame(
  labels = c("Total", "Medical", "Retail"),
  x = as.Date(c(2020-01, 2010-01, 2022-01)),
  y = c(50, 20, 50),
  color = c(line_color1, line_color2, line_color3)
)

data_county %>%
  group_by(County) %>%
  ggplot(aes(x = Total_Sale, group = County, fill = County)) +
  geom_histogram()
