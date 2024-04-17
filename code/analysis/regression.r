source("code/data-management/flights-airfare-merge.r")

library(estimatr)
library(fixest)

hub_iv_mod <- feols(fare_pm ~ as.factor(CARRIER)| ORIGIN + YEAR + DEST| HUB2HUB ~  AS_HUB2HUB + AA_HUB2HUB + DL_HUB2HUB + G4_HUB2HUB + F9_HUB2HUB + NK_HUB2HUB + WN_HUB2HUB + UA_HUB2HUB, flight_prices)

hub_iv_mod <- feols(fare_pm ~ as.factor(CARRIER)| ORIGIN + YEAR + DEST + fare_lg| HUB2HUB ~  AS_HUB2HUB + AA_HUB2HUB + DL_HUB2HUB + G4_HUB2HUB + F9_HUB2HUB + NK_HUB2HUB + WN_HUB2HUB + UA_HUB2HUB, flight_prices)


# etable(hub_iv_mod,tex = TRUE)
summary(hub_iv_mod)
etable(hub_iv_mod)

tidy_hub_iv <- broom::tidy(hub_iv_mod)
tidy_hub_iv

write.csv(tidy_hub_iv,"output/hub_IV_reg.csv")
