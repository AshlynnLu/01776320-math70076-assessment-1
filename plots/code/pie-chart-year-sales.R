# Load necessary libraries
library(ggplot2)
library(grid)
library(ggnewscale)
library(ggtext)
library(tidyverse)
library(shadowtext)
library(patchwork)
library(dplyr)
library(gridExtra)
library(ggthemes)

# Load colors
source("plots/code/color-setting.R")
# Load data
load("data/derived/combined_county.RData")
load("data/derived/total_sales_by_year.RData")



county_sales_donut_chart <- ggplot() +
  geom_bar(data = combined_county,
           aes(x = 0, y = Prop, fill = County),
           stat = "identity",
           width = 1) +
  coord_polar("y", start = 0) +
  xlim(c(-1.5, 1.5)) +
  theme_void() +
  facet_wrap(~Year, nrow = 2) +
  scale_fill_manual(values=c(BLUE, CYAN, YELLOW, GREEN, DARK_RED, LIGHT_GREEN, OTHER1)) +
  geom_text(data = total_sales_by_year,
            aes(label = paste("Total\n", "$", round(Total_Sales/1e6), "m")),
            x = -1.5, y = 0, size = 7.5/.pt, family = "Econ Sans Cnd") +
  labs(title = "The total sales by year",
       subtitle = "Colorado, 2014 to 2024",
       caption = "Source: the Colorado Department of Revenue") +
  theme(
    # Plot title
    plot.title = element_text(size = 9.5, family = "Econ Sans Cnd", face = "bold"),
    # Subtitle
    plot.subtitle = element_text(size = 8, margin = margin(11/.pt, 0, 0, 0)),
    # Source
    plot.caption = element_markdown(size = 6.5, hjust = 0,
                                    family = "Econ Sans Cnd Light",
                                    color = source_color,
                                    margin = margin(10/.pt, 0, 0, 0)),
    # Set background color to white
    plot.background = element_rect(fill = "white", color = "white"),
    # Adjust legend key size
    legend.key.height = unit(7.5, "pt"),
    legend.key.width = unit(5, "pt"),
    # Adjust legend title
    legend.title = element_text(size = 7.5,
                                family = "Econ Sans Cnd Medium"),
    # Adjust legend text size
    legend.text = element_text(size = 7.5, family = "Econ Sans Cnd Light"),
    # Adjust the size of facet titles (year titles)
    strip.text = element_text(size = 8, family = "Econ Sans Cnd",
                              margin = margin(15/.pt,0, -5/.pt, 0), hjust = 0),
    strip.clip = "off",
    # Make the facet closer
    panel.spacing = unit(-1, "pt")
  )


# Save as png
ggsave("plots/figure/county_sales_donut_chart.png", county_sales_donut_chart,
       scale = 3, dpi = 300,
       width = 595, height = 290, units = "px")

