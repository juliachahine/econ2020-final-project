#######################################
## Raw Data: US Department of Transportation: 
############ Consumer Airfare Report: Table 1a - All US Airport Pair Markets 
#######################################
## Script:  
#######################################

## Libraries

library(data.table)

## CSV Import

prices_csv <- read.csv("data/USDOT/Consumer_Airfare_Report__Table_1a_-_All_U.S._Airport_Pair_Markets_20240415_All.csv")

## As Data Table

prices <- as.data.table(prices_csv)



