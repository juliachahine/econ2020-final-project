#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
    #| echo: false
    #| results: asis
    #| warning: false
    library(fixest)
    
    data(airquality)
    
    # Setting a dictionary 
    setFixest_dict(c(Ozone = "Ozone (ppb)", Solar.R = "Solar Radiation (Langleys)",
                     Wind = "Wind Speed (mph)", Temp = "Temperature"))
    est = feols(Ozone ~ Solar.R + sw0(Wind + Temp) | csw(Month, Day), 
                airquality, cluster = ~Day)
    
    est_slopes = feols(Ozone ~ Solar.R + Wind | Day + Month[Temp], airquality)
    
    
    etable(est, est_slopes, tex = TRUE)
    ```
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
