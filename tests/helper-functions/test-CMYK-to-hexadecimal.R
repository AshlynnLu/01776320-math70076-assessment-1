# Import libraries
library(ggplot2)
library(grid)
library(gridExtra)


# Load function
source("src/helper-functions/CMYK_to_hexadecimal.R")

# Test
# C90, M50, Y15, K5
CMYK_to_hexadecimal(90, 50, 15, 5)

# C67, M0, Y18, K0
CMYK_to_hexadecimal(67, 0, 18, 0)

# C12, M30, Y70, K0
CMYK_to_hexadecimal(12, 30, 70, 0)
