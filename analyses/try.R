# Load necessary libraries
library(ggplot2)
library(dplyr)
library(gridExtra)


# Bar chart of total sales by county
ggplot(data_county, aes(x = reorder(County, -(Medical + Retail)), y = Medical + Retail, fill = factor(Year))) +
  geom_bar(stat = "identity") +
  labs(x = NULL, y = NULL, title = "Total Cannabis Sales by County") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18, hjust = 0.5, color = "#0056A7", face = "bold"),
    axis.title = element_blank(),
    axis.text = element_text(color = "#0056A7"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.title = element_blank(),
    legend.position = "bottom"
  )

# Combine plots into a single infographic layout
infographic <- grid.arrange(sales_trend_plot, sales_by_county_plot, ncol = 1, heights = c(1, 2))

# Save the infographic
ggsave("cannabis_sales_infographic.pdf", infographic, width = 20, height = 24)

# Print the infographic
print(infographic)
