# Title     : HIR
# Objective : HIR
# Created by: Think
# Created on: 04/11/2021

HighestIndividualReadings <- function (readings, stations) {

  expanded <- left_join(x = readings, y = stations, by = 'stationID', keep = FALSE)
  expanded_ <- expanded[order(-expanded$rain), ]
  expanded_ %>%
    tibble()

  return(head(expanded_, n = 5))

}