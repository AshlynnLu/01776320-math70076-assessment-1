# Import libraries
library(ggplot2)
library(grid)
library(gridExtra)

# Load function
source("src/helper-functions/add-watermark.R")

# Test
# Define a sample dataset
test_data <- data.frame(
  x = c(1, 2, 3, 4, 5),
  y = c(2, 3, 5, 4, 6)
)

# Create a scatter plot using ggplot2
plt <- ggplot(test_data, aes(x = x, y = y)) +
  geom_point() +
  labs(title = "Scatter Plot with Squared Values", x = "X", y = "Y")

png("tests/helper-functions/plot.png",
    width = 290*5, height = 290*5, units = "px", res = 300) # Open file to store the plot
plt # Print the plot
red_box_on_top() # Apply function
dev.off() # Close connection
