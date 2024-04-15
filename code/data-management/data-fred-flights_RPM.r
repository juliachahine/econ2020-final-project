source("apiKeys.r")
library(fredr)


fredr_set_key(fred_api_key)

RPM <- fredr(series_id = "RPMD11")
RPM
