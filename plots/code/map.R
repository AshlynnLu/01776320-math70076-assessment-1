# Load necessary libraries
library(ggplot2)
library(ggtext)
library(tidyverse)
library(dplyr)
library(grid)
library(gridExtra)

# Load colors
source("plots/code/color-setting.R")
# Load function to add watermark
source("src/helper-functions/add-watermark.R")

# Load data
load("data/derived/merged_pop.RData")


pop_map <- ggplot(data = colorado, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(data = colorado_county, fill = NA, color = "white") +
  geom_polygon(data = Merged_pop,
               aes(x = long, y = lat, group = group, fill = category),
               color = "white", size = 0.2) +
  ggtitle('Colorado Map with Counties') +
  scale_fill_manual(name = 'Population',
                    values = BLUES)+
  labs(title = "Population",
       subtitle = "Colorado, 2015, k",
       caption = "Source: the Colorado State Demography Office",
       fill = "Population") +
  theme(
    # Plot title
    plot.title = element_text(size = 9.5, face = "bold"),
    # Subtitle
    plot.subtitle = element_text(size = 8, margin = margin(11, 0, 0, 0)),
    # Source
    plot.caption = element_text(size = 6.5, hjust = 0,
                                family = "Econ Sans Cnd Light",
                                color = source_color,
                                margin = margin(10, 0, 0, 0)),
    # Set background color to white
    panel.background = element_rect(fill = "white", color = "white"),
    # Remove the title for both axes
    axis.title = element_blank(),
    # Remove tick marks on both axis
    axis.ticks.length.x = unit(0, "pt"),
    axis.ticks.length.y = unit(0, "pt"),
    # Remove grid values on both axis
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    # Adjust legend position
    legend.position = "top",
    legend.margin = margin(15, 0,  0,  0),
    # Adjust background underneath legend keys
    legend.key = element_rect(fill = "white"),
    # Adjust legend text size
    legend.text = element_text(size = 7.5, family = "Econ Sans Cnd Light"),
    # Adjust legend key size
    legend.key.height = unit(7.5, "pt"),
    # Align legend to left
    legend.justification = c(0, 2),
    # Adjust plot margin
    plot.margin = margin(17, 0, 5, 0, unit = "pt")
  )  +
  # Adjust legend position to the right and adjust font size
  guides(color = guide_legend(title.position = "left",
                              title.theme = element_text(size = 7.5,
                                                         family = "Econ Sans Cnd Medium")))

# Open file to store the plot
png("plots/figure/pop-map-plot.png",
    width = 290*4, height = 290*4, units = "px", res = 300)

pop_map

# Add red box
red_box_on_top()

# Close connection
dev.off()

