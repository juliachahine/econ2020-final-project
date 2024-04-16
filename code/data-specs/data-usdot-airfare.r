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

## Remove out of range data 

prices <- prices[Year <= 2024 & Year >= 2020]

## Price per mile 
prices$fare_pm <- prices$fare / prices$nsmiles

## low fare per mile 
prices$fare_low_pm <- prices$fare_low / prices$nsmiles

## high fare per mile 
prices$fare_high_pm <- prices$fare_lg / prices$nsmiles

## Passengers per mile
prices$passengers_pm <- prices$passengers / prices$nsmiles