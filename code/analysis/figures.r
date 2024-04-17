source("code/data-management/flights-airfare-merge.r")
library(ggplot2)


figure <- ggplot(data = flight_prices) + 
    geom_boxplot(aes(fare_pm, as.factor(UNIQUE_CARRIER_NAME), color = as.factor(HUB2HUB)), notch = TRUE) + scale_color_manual(values = c("#7BD3EA", "#891652"))

figure_labeled <- figure + labs(
    title = "Fare per nMile, by Carrier",
    x = "Fare per nMile",
    y = "US Carrier",
    color = "Hub to Hub"
) + theme_bw()


ggsave("output/figure.png", plot = figure_labeled)