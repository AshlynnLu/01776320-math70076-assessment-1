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

source("CMYK_to_hexadecimal.R")

line_color1 <- CMYK_to_hexadecimal(90, 50, 15, 5)
line_color2 <- CMYK_to_hexadecimal(67, 0, 18, 0)
line_color3 <- CMYK_to_hexadecimal(12, 30, 70, 0)
background_color <- CMYK_to_hexadecimal(7.5, 0, 0, 5)
grid_color <- CMYK_to_hexadecimal(10, 0, 0, 25)

line_labels <- data.frame(
  labels = c("Total", "Medical", "Retail"),
  x = as.Date(c(16000, 16500, 19020)),
  y = c(90, 20, 90),
  color = c(line_color1, line_color2, line_color3)
)

plot <- data_total_sale %>%
  ggplot() +
  geom_line(aes(x = Year_Month, y = Total_Sale/1e6, color = "Total Sale"), show.legend = TRUE) +
  geom_line(aes(x = Year_Month, y = Medical/1e6, color = "Medical"), show.legend = TRUE) +
  geom_line(aes(x = Year_Month, y = Retail/1e6, color = "Retail"), show.legend = TRUE) +
  scale_color_manual(values = c("Total Sale" = line_color1, "Medical" = line_color2, "Retail" = line_color3)) +
  theme_economist(base_family = "sans") +
  scale_color_economist() +
  theme(
    # Remove the title for both axes
    axis.title = element_blank(),
    # Adjust grid line color
    panel.grid.major.y = element_line(color = grid_color, size = 0.5),
    legend.text = element_text(size = 7.5/.pt, family = "Econ Sans Cnd")

  )



  theme(
    # Remove the title for both axes
    axis.title = element_blank(),
    # Set background color to white
    panel.background = element_rect(fill = background_color),
    # Remove all grid lines
    panel.grid = element_blank(),
    # Add grid lines for the vertical axis, customizing color and size
    panel.grid.major.y = element_line(color = grid_color, size = 0.5),
    # Remove tick marks on the vertical axis
    axis.ticks.length.y = unit(0, "pt"),
    # Keep tick marks on horizontal axis
    axis.ticks.length.x = unit(3, "pt"),
    # Font size of the axis label
    axis.text.x = element_text(size = 7/.pt),
    # Only the bottom line of the vertical axis is painted in black
    axis.line.x.bottom = element_line(color = "black"),
    # Remove labels from the vertical axis
    axis.text.y = element_blank(),
    # Adjust legend position
    legend.position = "top",
    # Adjust legend background
    legend.background = element_rect(fill = background_color),
    # Adjust background underneath legend keys
    legend.key = element_rect(fill = background_color),
    legend.text = element_text(size = 7.5/.pt, family = "Econ Sans Cnd", face = "light")
  ) +
  new_scale_color() +
  geom_shadowtext(
    aes(x, y, label = labels, color = color),
    data = line_labels,
    hjust = 0, # Align to the left
    bg.colour = background_color, # Shadow color (or background color)
    size = 7.5/.pt
  ) +
  scale_color_identity() # Use the colors in the 'color' variable as they are.




