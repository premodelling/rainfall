# Title     : Highest Individual Readings
# Objective : The rainfall readings records that have the highest readings values
# Created by: Think
# Created on: 04/11/2021

HighestIndividualReadings <- function (readings, stations) {
  #' Highest Individual Readings
  #'
  #' Determines the rainfall readings records that have the highest readings values
  #'
  #' @param readings: The dataframe of rainfall readings, which must include the 'stationID' field, and the
  #'                  'month', 'year', and 'rain' fields
  #' @param stations: The dataframe of weather stations, which must include the 'stationID' & 'name' fields
  #'
  #'
  #' @return A data frame that consists of the 5 reading records that have the highest rain
  #'         quantity values,

  joined <- left_join(x = readings[, c('stationID', 'month', 'year', 'rain')],
                      y = stations[, c('stationID', 'name')],
                      by = 'stationID',
                      keep = FALSE)
  frame <- joined[order(-joined$rain), ]

  return(head(frame, n = 5))

}