######## Libraries
library(data.table)

######## CSV Imports
hubs_csv <- read.csv("data/hubs/airlineHubsCarrierCodes.csv")

######## Data Tables
hubs <- as.data.table(hubs_csv)

hubs[,c("STATE", "AIRPORT", "AIRPORT_CITY") := NULL]

