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


####### Flag if Carrier is at own Hub at origin
flights[,HUB_AT_ORIGIN_FLAG := ifelse(CARRIER %in% c(ORIGIN_HUB_ID1, ORIGIN_HUB_ID2, ORIGIN_HUB_ID3, ORIGIN_HUB_ID4, ORIGIN_HUB_ID5, ORIGIN_HUB_ID6, ORIGIN_HUB_ID7),1,0),]

####### Flag if Carrier is at own Hub at dest
flights[, HUB_AT_DEST_FLAG := ifelse(CARRIER %in% c(DEST_HUB_ID1, DEST_HUB_ID2, DEST_HUB_ID3, DEST_HUB_ID4, DEST_HUB_ID5, DEST_HUB_ID6, DEST_HUB_ID7),1,0),]




####### Origin HUB Flags 
flights
##
flights$AS_ORIGIN_HUB <- ifelse((flights$ORIGIN_HUB_ID1 == "AS"| flights$ORIGIN_HUB_ID2 == "AS"| flights$ORIGIN_HUB_ID3 == "AS"| flights$ORIGIN_HUB_ID4 == "AS"| flights$ORIGIN_HUB_ID5 == "AS"|flights$ORIGIN_HUB_ID6 == "AS"| flights$ORIGIN_HUB_ID7 == "AS") , 1, 0)

## Allegiant Air
flights$G4_ORIGIN_HUB <- ifelse((flights$ORIGIN_HUB_ID1 == "G4"| flights$ORIGIN_HUB_ID2 == "G4"| flights$ORIGIN_HUB_ID3 == "G4"| flights$ORIGIN_HUB_ID4 == "G4"| flights$ORIGIN_HUB_ID5 == "G4"|flights$ORIGIN_HUB_ID6 == "G4"| flights$ORIGIN_HUB_ID7 == "G4") , 1, 0)

## AA : American Airlines
flights$AA_ORIGIN_HUB <- ifelse((flights$ORIGIN_HUB_ID1 == "AA"| flights$ORIGIN_HUB_ID2 == "AA"| flights$ORIGIN_HUB_ID3 == "AA"| flights$ORIGIN_HUB_ID4 == "AA"| flights$ORIGIN_HUB_ID5 == "AA"|flights$ORIGIN_HUB_ID6 == "AA"| flights$ORIGIN_HUB_ID7 == "AA") , 1, 0)

## DL : Delta Airlines
flights$DL_ORIGIN_HUB <- ifelse((flights$ORIGIN_HUB_ID1 == "DL"| flights$ORIGIN_HUB_ID2 == "DL"| flights$ORIGIN_HUB_ID3 == "DL"| flights$ORIGIN_HUB_ID4 == "DL"| flights$ORIGIN_HUB_ID5 == "DL"|flights$ORIGIN_HUB_ID6 == "DL"| flights$ORIGIN_HUB_ID7 == "DL") , 1, 0)

## F9 : Frontier Airlines
flights$F9_ORIGIN_HUB <- ifelse((flights$ORIGIN_HUB_ID1 == "F9"| flights$ORIGIN_HUB_ID2 == "F9"| flights$ORIGIN_HUB_ID3 == "F9"| flights$ORIGIN_HUB_ID4 == "F9"| flights$ORIGIN_HUB_ID5 == "F9"|flights$ORIGIN_HUB_ID6 == "F9"| flights$ORIGIN_HUB_ID7 == "F9") , 1, 0)

## WN : Southwest Airlines
flights$WN_ORIGIN_HUB <- ifelse((flights$ORIGIN_HUB_ID1 == "WN"| flights$ORIGIN_HUB_ID2 == "WN"| flights$ORIGIN_HUB_ID3 == "WN"| flights$ORIGIN_HUB_ID4 == "WN"| flights$ORIGIN_HUB_ID5 == "WN"|flights$ORIGIN_HUB_ID6 == "WN"| flights$ORIGIN_HUB_ID7 == "WN") , 1, 0)

## NK : Spirit Airlines
flights$NK_ORIGIN_HUB <- ifelse((flights$ORIGIN_HUB_ID1 == "NK"| flights$ORIGIN_HUB_ID2 == "NK"| flights$ORIGIN_HUB_ID3 == "NK"| flights$ORIGIN_HUB_ID4 == "NK"| flights$ORIGIN_HUB_ID5 == "NK"|flights$ORIGIN_HUB_ID6 == "NK"| flights$ORIGIN_HUB_ID7 == "AS") , 1, 0)

## UA : United Airlines 
flights$UA_ORIGIN_HUB <- ifelse((flights$ORIGIN_HUB_ID1 == "UA"| flights$ORIGIN_HUB_ID2 == "UA"| flights$ORIGIN_HUB_ID3 == "UA"| flights$ORIGIN_HUB_ID4 == "UA"| flights$ORIGIN_HUB_ID5 == "UA"|flights$ORIGIN_HUB_ID6 == "UA"| flights$ORIGIN_HUB_ID7 == "UA") , 1, 0)


####### Destination HUB Flags 

## AS : Alaska Airlines
flights$AS_DEST_HUB <- ifelse((flights$DEST_HUB_ID1 == "AS"| flights$DEST_HUB_ID2 == "AS"| flights$DEST_HUB_ID3 == "AS"| flights$DEST_HUB_ID4 == "AS"| flights$DEST_HUB_ID5 == "AS"|flights$DEST_HUB_ID6 == "AS"| flights$DEST_HUB_ID7 == "AS") , 1, 0)

## G4 : Allegiant Air
flights$G4_DEST_HUB <- ifelse((flights$DEST_HUB_ID1 == "G4"| flights$DEST_HUB_ID2 == "G4"| flights$DEST_HUB_ID3 == "G4"| flights$DEST_HUB_ID4 == "G4"| flights$DEST_HUB_ID5 == "G4"|flights$DEST_HUB_ID6 == "G4"| flights$DEST_HUB_ID7 == "G4") , 1, 0)

## AA : American Airlines
flights$AA_DEST_HUB <- ifelse((flights$DEST_HUB_ID1 == "AA"| flights$DEST_HUB_ID2 == "AA"| flights$DEST_HUB_ID3 == "AA"| flights$DEST_HUB_ID4 == "AA"| flights$DEST_HUB_ID5 == "AA"|flights$DEST_HUB_ID6 == "AA"| flights$DEST_HUB_ID7 == "AA") , 1, 0)

## DL : Delta Airlines
flights$DL_DEST_HUB <- ifelse((flights$DEST_HUB_ID1 == "DL"| flights$DEST_HUB_ID2 == "DL"| flights$DEST_HUB_ID3 == "DL"| flights$DEST_HUB_ID4 == "DL"| flights$DEST_HUB_ID5 == "DL"|flights$DEST_HUB_ID6 == "DL"| flights$DEST_HUB_ID7 == "DL") , 1, 0)

## F9 : Frontier Airlines
flights$F9_DEST_HUB <- ifelse((flights$DEST_HUB_ID1 == "F9"| flights$DEST_HUB_ID2 == "F9"| flights$DEST_HUB_ID3 == "F9"| flights$DEST_HUB_ID4 == "F9"| flights$DEST_HUB_ID5 == "F9"|flights$DEST_HUB_ID6 == "F9"| flights$DEST_HUB_ID7 == "F9") , 1, 0)

## WN : Southwest Airlines
flights$WN_DEST_HUB <- ifelse((flights$DEST_HUB_ID1 == "WN"| flights$DEST_HUB_ID2 == "WN"| flights$DEST_HUB_ID3 == "WN"| flights$DEST_HUB_ID4 == "WN"| flights$DEST_HUB_ID5 == "WN"|flights$DEST_HUB_ID6 == "WN"| flights$DEST_HUB_ID7 == "WN") , 1, 0)

## NK : Spirit Airlines
flights$NK_DEST_HUB <- ifelse((flights$DEST_HUB_ID1 == "NK"| flights$DEST_HUB_ID2 == "NK"| flights$DEST_HUB_ID3 == "NK"| flights$DEST_HUB_ID4 == "NK"| flights$DEST_HUB_ID5 == "NK"|flights$DEST_HUB_ID6 == "NK"| flights$DEST_HUB_ID7 == "AS") , 1, 0)

## UA : United Airlines 
flights$UA_DEST_HUB <- ifelse((flights$DEST_HUB_ID1 == "UA"| flights$DEST_HUB_ID2 == "UA"| flights$DEST_HUB_ID3 == "UA"| flights$DEST_HUB_ID4 == "UA"| flights$DEST_HUB_ID5 == "UA"|flights$DEST_HUB_ID6 == "UA"| flights$DEST_HUB_ID7 == "UA") , 1, 0)


# ######## Flag if flight went from a HUB to a HUB 

flights[, AS_HUB2HUB := (AS_ORIGIN_HUB == 1 & AS_DEST_HUB == 1)]
flights[, AA_HUB2HUB := (AA_ORIGIN_HUB == 1 & AA_DEST_HUB == 1)]
flights[, G4_HUB2HUB := (G4_ORIGIN_HUB == 1 & G4_DEST_HUB == 1)]
flights[, DL_HUB2HUB := (DL_ORIGIN_HUB == 1 & DL_DEST_HUB == 1)]
flights[, F9_HUB2HUB := (F9_ORIGIN_HUB == 1 & F9_DEST_HUB == 1)]
flights[, WN_HUB2HUB := (WN_ORIGIN_HUB == 1 & WN_DEST_HUB == 1)]
flights[, NK_HUB2HUB := (NK_ORIGIN_HUB == 1 & NK_DEST_HUB == 1)]
flights[, UA_HUB2HUB := (UA_ORIGIN_HUB == 1 & UA_DEST_HUB == 1)]
flights[, HUB2HUB := (AS_HUB2HUB == 1 | AA_HUB2HUB == 1 | G4_HUB2HUB == 1 | DL_HUB2HUB == 1 | F9_HUB2HUB == 1 | WN_HUB2HUB == 1 | NK_HUB2HUB == 1 | UA_HUB2HUB == 1)]




