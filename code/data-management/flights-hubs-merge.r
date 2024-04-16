#######################################
## Raw Data: Bureau of Transportation, T100 US Carriers Data from 2020-2024; 
############ and Airport / Hubs Classifications CSV (from Wikipedia, manual)
#######################################
## Script: Merge all flight data, and flag flights that are Hub to Hub 
#######################################

######## Source
source("code/data-specs/data-flights.r")
source("code/data-specs/data-hubs.r")
####### Origin Airport <--> Add Hub

## Lists of Airports & Hubs of Interest

airport_id_names <- unique(hubs$AIRPORT_ID)

hub_id_names <- unique(hubs$HUB__ID1)

## Remove flights 
flights <- flights[CARRIER %in% hub_id_names]
flights <- flights[ORIGIN %in% airport_id_names]
flights <- flights[DEST %in% airport_id_names]
flights

flights <- merge(flights,hubs, by.x = "ORIGIN", by.y = "AIRPORT_ID", allow.cartesian=TRUE)

setnames(flights, "HUB1","ORIGIN_HUB1")
setnames(flights, "HUB2","ORIGIN_HUB2")
setnames(flights, "HUB3","ORIGIN_HUB3")
setnames(flights, "HUB4","ORIGIN_HUB4")
setnames(flights, "HUB5","ORIGIN_HUB5")
setnames(flights, "HUB6","ORIGIN_HUB6")
setnames(flights, "HUB7","ORIGIN_HUB7")

setnames(flights, "HUB__ID1","ORIGIN_HUB_ID1")
setnames(flights, "HUB_ID2","ORIGIN_HUB_ID2")
setnames(flights, "HUB__ID3","ORIGIN_HUB_ID3")
setnames(flights, "HUB__ID4","ORIGIN_HUB_ID4")
setnames(flights, "HUB__ID5","ORIGIN_HUB_ID5")
setnames(flights, "HUB__ID6","ORIGIN_HUB_ID6")
setnames(flights, "HUB__ID7","ORIGIN_HUB_ID7")

flights <- merge(flights,hubs, by.x = "DEST", by.y = "AIRPORT_ID", allow.cartesian=TRUE)

setnames(flights, "HUB1","DEST_HUB1")
setnames(flights, "HUB2","DEST_HUB2")
setnames(flights, "HUB3","DEST_HUB3")
setnames(flights, "HUB4","DEST_HUB4")
setnames(flights, "HUB5","DEST_HUB5")
setnames(flights, "HUB6","DEST_HUB6")
setnames(flights, "HUB7","DEST_HUB7")

setnames(flights, "HUB__ID1","DEST_HUB_ID1")
setnames(flights, "HUB_ID2","DEST_HUB_ID2")
setnames(flights, "HUB__ID3","DEST_HUB_ID3")
setnames(flights, "HUB__ID4","DEST_HUB_ID4")
setnames(flights, "HUB__ID5","DEST_HUB_ID5")
setnames(flights, "HUB__ID6","DEST_HUB_ID6")
setnames(flights, "HUB__ID7","DEST_HUB_ID7")


################################################################################################## GREAT PLACE FOR A UNIT TEST 
flights[,c("STATE","AIRPORT","AIRPORT_CITY") := NULL]

####make delta hub, south west hub, etc. flags....

####### Flag if Carrier is at own Hub at origin
flights$HUB_AT_ORIGIN_FLAG <- flights[,CARRIER == ]
flights

####### Flag if Carrier is at own Hub at dest
flights$HUB_AT_DEST_FLAG <- flights[, CARRIER == DEST_HUB_CARRIER_ID]


######## Flag if Origin Hub is Dest Hub 
flights$HUB2HUB <- flights[, ORIGIN_HUB == DEST_HUB]
################################################################################################## GREAT PLACE FOR A UNIT TEST 

######## Create Quarter Date Variable 
flights$QUARTER <- ceiling(as.integer(flights$MONTH)/3)
flights

######## Passengers per mile traveled
flights$PASSPERMILE <- flights[, PASSENGERS / DISTANCE]
flights


flights <- flights[!(flights$CARRIER %in% hubs$HUB_CARRIER_ID),]
flights

