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

flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == ORIGIN_HUB_CARRIER_ID)]

## Avg fare per mile by Carrier, where dest is a Hub

flight_prices[, .(avgFarePM = mean(fare_pm), n = .N), by = .(UNIQUE_CARRIER == DEST_HUB_CARRIER_ID)]
