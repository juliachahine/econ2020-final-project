source("code/data-management/flights-airfare-merge.r")
library(ggplot2)

flight_prices
figure1 <- ggplot(data = flight_prices) + 
    geom_boxplot(aes(x = as.factor(UNIQUE_CARRIER_NAME), y = fare_pm))
figure1

figure1 <- ggplot(data = flight_prices) + 
    geom_boxplot(aes(fare_pm, as.factor(UNIQUE_CARRIER_NAME), color = as.factor(HUB2HUB)), notch = TRUE)
figure1

fig2 <- ggplot(data = flight_prices) + 
    geom_boxplot(aes(fare_pm, as.factor(UNIQUE_CARRIER_NAME), color = as.factor(DL_HUB2HUB)))
fig2

fig2 <- ggplot(data = flight_prices) + 
    geom_boxplot(aes(fare_pm, as.factor(UNIQUE_CARRIER_NAME), color = as.factor(UA_HUB2HUB)))
fig2
