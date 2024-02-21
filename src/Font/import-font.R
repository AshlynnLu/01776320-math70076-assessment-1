# Import packages
library(extrafont)
library(showtext)

# Add font
font_add(family = "Econ Sans Cnd",
         regular = "econsanscndreg-webfont.woff.ttf",
         bold = "econsans-condensed-primary-subset-bd.ttf")
font_add(family = "Econ Sans Cnd Light",
         regular = "econsans-subset-cd-li.woff.ttf")
font_add(family = "Econ Sans Cnd Medium",
         regular = "econsanscndmed-webfont.woff.ttf")
font_add(family = "Econ Sans Bold",
         regular = "SourceSansProBold.ttf")

# Load into R
loadfonts()

