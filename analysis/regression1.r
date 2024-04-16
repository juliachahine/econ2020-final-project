source("code/data-management/flights-airfare-merge.r")

mod1 <- lm(fare_pm ~ CARRIER_NAME + CARRIER_NAME*HUB2HUB, flight_prices)
mod1
summary(mod1)
