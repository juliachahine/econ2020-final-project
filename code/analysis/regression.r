source("code/data-management/flights-airfare-merge.r")

library(estimatr)
library(fixest)

mod4 <- feols(fare_pm ~ as.factor(CARRIER) | ORIGIN + DEST| HUB2HUB ~  AS_HUB2HUB + AA_HUB2HUB + DL_HUB2HUB + G4_HUB2HUB + F9_HUB2HUB + NK_HUB2HUB + WN_HUB2HUB + UA_HUB2HUB, flight_prices)

summary(mod4)

