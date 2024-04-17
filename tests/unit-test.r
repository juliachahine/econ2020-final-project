library(testthat)
testthat::local_edition(3)

library(data.table)

flights <- data.table::fread(".data/flight-price-hub-data-cleaned.csv")

test_that("test-1",{
    expect_false(flights$ORIGIN_HUB1 == flights$ORIGIN_HUB2)
})
