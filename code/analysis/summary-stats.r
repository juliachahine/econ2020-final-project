source("code/data-management/flights-airfare-merge.r")

flight_prices

## Number of Flights by Carrier

flight_prices[, .(n = .N), by = UNIQUE_CARRIER_NAME]

## Number of Flights by Origin Airport 

flight_prices[, .(n = .N), by = .(ORIGIN)]

## Number of Flights by Dest Airport 

flight_prices[, .(n = .N), by = .(DEST)]

## Number of Flights by Origin  & Dest Airport

flight_prices[, .(n = .N), by = .(ORIGIN, DEST)]

## Number of Flights by Origin  & Dest Airport & Year

flight_prices[, .(n = .N), by = .(ORIGIN, DEST, YEAR)]

## Number of Flights by Origin  & Dest Airport & Year

flight_prices[, .(n = .N), by = .(ORIGIN, DEST, MONTH, YEAR)]

## Number of Flights that are Hub to Hub 

flight_prices[, .(n = .N), by = .(HUB2HUB)]

## N of Flights w Low Fare Carrier

flight_prices[, .(n = .N), by = .(carrier_lf_flag)]

## N of Flights w High Fare Carrier

flight_prices[, .(n = .N), by = .(carrier_hf_flag)]

## N of Flights where Hub2Hub is lowest fare

flight_prices[, .(n = .N), by = .(HUB2HUB, carrier_lf_flag)]

## N of Flights where Hub2Hub is highest fare

flight_prices[, .(n = .N), by = .(HUB2HUB, carrier_hf_flag)]

## Avg fare per mile by Carrier 

flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER_NAME)]

## Avg fare per mile by Carrier, where origin is a Hub

flight_prices[, .(avgFarePM = mean(fare_pm), avgFareLow = mean(fare_low_pm), avgFareHigh = mean(fare_high_pm), n = .N), by = .(as.factor(UNIQUE_CARRIER), AA_ORIGIN_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "AS", AS_ORIGIN_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "DL", DL_ORIGIN_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "G4", G4_ORIGIN_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "F9", F9_ORIGIN_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "WN", WN_ORIGIN_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "NK", NK_ORIGIN_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "UA", UA_ORIGIN_HUB == 1)]

## Avg fare per mile by Carrier, where dest is a Hub

flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "AA", AA_DEST_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "AS", AS_DEST_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "DL", DL_DEST_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "G4", G4_DEST_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "F9", F9_DEST_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "WN", WN_DEST_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "NK", NK_DEST_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "UA", UA_DEST_HUB == 1)]

## Avg fare per mile by Carrier, hub to hub

flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "AA", AA_HUB2HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "AS", AS_HUB2HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "DL", DL_HUB2HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "G4", G4_HUB2HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "F9", F9_HUB2HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "WN", WN_DEST_HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "NK", NK_HUB2HUB == 1)]
flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == "UA", UA_HUB2HUB == 1)]

## Avg fare per mile by Carrier HUB 

flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(AA_HUB2HUB == 1, AS_HUB2HUB == 1, DL_HUB2HUB == 1, G4_HUB2HUB == 1, F9_HUB2HUB == 1, WN_HUB2HUB == 1, NK_HUB2HUB == 1,  UA_HUB2HUB == 1)]
