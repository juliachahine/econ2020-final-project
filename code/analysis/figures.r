source("code/data-management/flights-airfare-merge.r")
library(ggplot2)

flight_prices
figure1 <- ggplot(data = flight_prices) + 
    geom_boxplot(aes(x = as.factor(UNIQUE_CARRIER_NAME), y = fare_pm))
figure1

figure1 <- ggplot(data = flight_prices) + 
    geom_boxplot(aes(x = as.factor(DL_HUB2HUB), y = fare_pm))
figure1
