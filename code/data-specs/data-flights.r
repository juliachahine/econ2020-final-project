######## Libraries
library(data.table)

######## CSV Imports
## BTS 
flights20_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2020.csv")
flights21_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2021.csv")
flights22_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2022.csv")
flights23_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2023.csv")
flights24_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2024.csv")

####### Data Tables
flights20 <- as.data.table(flights20_csv)
flights21 <- as.data.table(flights21_csv)
flights22 <- as.data.table(flights22_csv)
flights23 <- as.data.table(flights23_csv)
flights24 <- as.data.table(flights24_csv)

####### Combine BTS Data
flights20_21 <- rbind(flights20, flights21)
flights20_21_22 <- rbind(flights20_21, flights22)
flights20_21_22_23 <- rbind(flights20_21_22, flights23)
flights <- rbind(flights20_21_22_23, flights24)
flights

######## Create Quarter Date Variable 
flights$QUARTER <- ceiling(as.integer(flights$MONTH)/3)
flights