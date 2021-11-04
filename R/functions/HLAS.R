# Title     : Highest & Lowest Annual Stations
# Objective : Highest & Lowest Annual Stations
# Created by: Think
# Created on: 04/11/2021

HLAS <- function (extremes, stations) {

  extremes_ <- left_join(x = extremes, y = stations[, c('stationID', 'name')], by = 'stationID', keep = FALSE)
  extremes_ <- extremes_[order(-extremes_$total), ]
  highest_set <- head(extremes_, n = 5)

  lowest_set <- tail(extremes_, n = 5) %>%
    arrange(total)

  return(list('highest' = highest_set, 'lowest' = lowest_set))

}