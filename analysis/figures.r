source("code/data-management/flights-airfare-merge.r")
library(ggplot2)

flight_prices
figure1 <- ggplot(data = flight_prices) + 
    geom_point(aes(x = as.factor(CARRIER_NAME), y = as.factor(HUB2HUB)))
figure1
