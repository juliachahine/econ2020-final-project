source("code/data-management/flights-airfare-merge.r")

library(estimatr)
library(fixest)

mod1 <- lm(fare_pm ~ AS_HUB2HUB + AA_HUB2HUB + DL_HUB2HUB + G4_HUB2HUB + F9_HUB2HUB + NK_HUB2HUB + WN_HUB2HUB + UA_HUB2HUB, flight_prices)
mod1
summary(mod1)

broom::tidy(mod1)

mod2 <- feols(fare_pm ~ AS_HUB2HUB + AA_HUB2HUB + DL_HUB2HUB + G4_HUB2HUB + F9_HUB2HUB + NK_HUB2HUB + WN_HUB2HUB + UA_HUB2HUB | UNIQUE_CARRIER, flight_prices)
mod2
summary(mod2)

mod2 <- feols(fare_pm ~  UNIQUE_CARRIER | AS_HUB2HUB + AA_HUB2HUB + DL_HUB2HUB + G4_HUB2HUB + F9_HUB2HUB + NK_HUB2HUB + WN_HUB2HUB + UA_HUB2HUB , flight_prices)
mod2
summary(mod2)