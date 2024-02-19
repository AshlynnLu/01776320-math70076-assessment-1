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

#data_non_NR_NA <- readRDS(data_non_NR_NA)

source("analyses/color-setting.R")

data_total_sale %>%
  ggplot() +
  geom_line(aes(x = Year_Month, y = Total_Sale/1e6, color = "Total Sale"), show.legend = TRUE) +
  geom_line(aes(x = Year_Month, y = Medical/1e6, color = "Medical"), show.legend = TRUE) +
  geom_line(aes(x = Year_Month, y = Retail/1e6, color = "Retail"), show.legend = TRUE) +
  scale_color_manual(values = c("Total Sale" = BLUE, "Medical" = CYAN, "Retail" = YELLOW)) +
  # Make the y grid values to the right
  scale_y_continuous(position = "right") +
  # Title, subtitle, source, and legend title
  labs(title = "Marijuana Sales",
       subtitle = "Colorado, 2014 to 2024, $m",
       caption = "Source: the Colorado Department of Revenue",
       color = "Sales type") +
  theme(
    # Text font
    text = element_text(family = "Econ Sans Cnd"),
    # Plot title
    plot.title = element_text(size = 9.5, face = "bold"),
    # Subtitle
    plot.subtitle = element_text(size = 8),
    # Source
    plot.caption = element_markdown(size = 6.5, hjust = 0, color = source_color),
    # Remove the title for both axes
    axis.title = element_blank(),
    # Set background color to white
    panel.background = element_rect(fill = "white"),
    # Remove all grid lines
    panel.grid = element_blank(),
    # Add grid lines for the vertical axis, customizing color and size
    panel.grid.major.y = element_line(color = grid_color, size = 0.5),
    # Remove tick marks on the vertical axis
    axis.ticks.length.y = unit(0, "pt"),
    # Keep tick marks on horizontal axis
    axis.ticks.length.x = unit(3, "pt"),
    # Make vertical grid values on top of the grid line, adjust font size
    axis.text.y = element_text(size = 7, vjust = 0),
    # Font size of the axis label
    axis.text.x = element_text(size = 7),
    # Only the bottom line of the vertical axis is painted in black
    axis.line.x.bottom = element_line(color = "black", size = 0.4),
    # Adjust legend position
    legend.position = "top",
    # Adjust background underneath legend keys
    legend.key = element_rect(fill = "white"),
    # Adjust legend text size
    legend.text = element_text(size = 7.5),
    # Align legend to left
    legend.justification = c(0, 2)
    )  +
  # Adjust legend position to the right and adjust font size
  guides(color = guide_legend(title.position = "top",
                              title.theme = element_text(hjust = 0, size = 7.5)))


