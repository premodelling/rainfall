# Title     : TODO
# Objective : TODO
# Created by: Think
# Created on: 02/11/2021

RainfallWettest <- function (data) {

  # Wettest month
  # Instead of arrange ... wettest[order(wettest$month_code), ]
  wettest <- averages %>%
    group_by(month, month_code) %>%
    summarise(mean = mean(mean_rainfall_month), .groups = 'drop') %>%
    arrange(month_code)

  return(wettest)

}