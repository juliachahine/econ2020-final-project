#######################################
## Raw Data: Bureau of Transportation, T100 US Carriers Data from 2020-2024; 
############ and Airport / Hubs Classifications CSV (from Wikipedia, manual)
#######################################
## Script: Merge all flight data, and flag flights that are Hub to Hub 
#######################################

######## Libraries
library(data.table)

######## CSV Imports
## BTS 
flights20_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2020.csv")
flights21_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2021.csv")
flights22_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2022.csv")
flights23_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2023.csv")
flights24_csv <- read.csv("data/bts/T_T100D_MARKET_US_CARRIER_ONLY_2024.csv")
## WIKI 
hubs_csv <- read.csv("data/hubs/airline_hub_classification.csv")

####### Data Tables
flights20 <- as.data.table(flights20_csv)
flights21 <- as.data.table(flights21_csv)
flights22 <- as.data.table(flights22_csv)
flights23 <- as.data.table(flights23_csv)
flights24 <- as.data.table(flights24_csv)

hubs <- as.data.table(hubs_csv)

####### Combine BTS Data 

flights20_21 <- rbind(flights20, flights21)
flights20_21_22 <- rbind(flights20_21, flights22)
flights20_21_22_23 <- rbind(flights20_21_22, flights23)
flights <- rbind(flights20_21_22_23, flights24)

####### Origin Airport <--> Add Hub 

flights <- merge(flights,hubs, by.x = "ORIGIN", by.y = "AIRPORT_ID", allow.cartesian=TRUE)
setnames(flights, "AIRPORT_HUB","ORIGIN_HUB")

################################################################################################## GREAT PLACE FOR A UNIT TEST 
flights[,c("STATE","AIRPORT","AIRPORT_CITY") := NULL]


####### Dest Airport <--> Add Hub 
flights <- merge(flights,hubs, by.x = "DEST", by.y = "AIRPORT_ID", allow.cartesian=TRUE)
setnames(flights, "AIRPORT_HUB", "DEST_HUB")
flights[,c("STATE","AIRPORT","AIRPORT_CITY") := NULL]


######## Flag if Origin Hub is Dest Hub 

flights$HUB2HUB <- flights[, ORIGIN_HUB == DEST_HUB]
################################################################################################## GREAT PLACE FOR A UNIT TEST 

######## Create Quarter Date Variable 

flights$QUARTER <- ceiling(as.integer(flights$MONTH)/3)
flights

######## Passengers per mile traveled

flights$PASSPERMILE <- flights[, PASSENGERS / DISTANCE]


flights[, .N, by = .(ORIGIN_CITY_NAME,ORIGIN,ORIGIN_HUB, DEST_CITY_NAME, DEST ,DEST_HUB, HUB2HUB)]


