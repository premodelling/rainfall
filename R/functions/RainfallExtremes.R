# Title     : Extremes
# Objective : Extremes
# Created by: Think
# Created on: 04/11/2021

RainfallExtremes <- function (data) {

  extremes <- data %>%
    group_by(stationID, year) %>%
    summarise(total = sum(rain), .groups = 'drop')

  return(extremes)
}