source("code/data-specs/data-flights.r")
source("code/data-specs/data-usdot-airfare.r")


flight_prices <- flights[prices, on = c(YEAR = "Year", QUARTER = "quarter", ORIGIN_AIRPORT_ID = "airportid_1", DEST_AIRPORT_ID = "airportid_2")]

## Flag if the low fare carrier was taken

flight_prices$carrier_lf_flag <- flight_prices[, .(UNIQUE_CARRIER == carrier_low & UNIQUE_CARRIER != carrier_lg)]

## Flag if the high fare carrier was taken 

flight_prices$carrier_hf_flag <- flight_prices[, UNIQUE_CARRIER == carrier_lg & UNIQUE_CARRIER != carrier_low]

########### Remove missing

flight_prices <- na.omit(flight_prices)

flight_prices
