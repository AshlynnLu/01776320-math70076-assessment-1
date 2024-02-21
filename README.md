# mat70076-assessment-1
# Legal cannabis sales reports

This project is to create an article of 200-300 words with 4 supporting data visualisations for analysing cannabis sales report data in Colorado. 

The article includes:

- A line plot shows the trend of cannabis sales from 2014 to 2024;
- A collection of pie charts showing the top 4 counties contributes to the total sale in each year;
- A bar plot shows 7 counties with the highest total sales;
- A map showing the population in Colorado.

## To reproduce

Clone or download this repo.

The code and analysis are structured as follows:

## data/

This directory contains all raw and derived datasets. Raw data for the cannabis sales are available from the [state's Google Sheet](https://docs.google.com/spreadsheets/d/1br_cwfHy24d2R2bcXacb2KarOIBKGrbR/edit#gid=1659782909). Raw data for the population in Colorado are avaliable from [the Current Population Estimates for Colorado Counties](https://gis.dola.colorado.gov/population/population-totals-counties/). Further information can be found in [metadata.txt](./data/raw/metadata.txt).

The derived data are all processed from the raw data by running the R files in data-cleaning. 

## src/

This directory contains the data cleaning process and helper functions. 

- The file `data-cleaning\` involves two R files which cleans the cannabis data and population data.
- The file `helper-function\` include two functions aid for plotting.
- The fonts used in the plots are available in the `font\` file, which can be imported using the file `import-font.R`.

## plots/

This directory contains the figures used in the article, and the code used to produce the plots. 

Figures are made following the style guidelines of The Economist as closely as possible.

## tests/

This directory contains the tests for each helper functions.

## report/

This directory contains the article in pdf, and the quarto file used to produce the article. 
