# Title     : Highest & Lowest Annual Stations
# Objective : The records that have the highest & lowest annual rainfall records
# Created by: Think
# Created on: 04/11/2021

#' Highest & Lowest Annual Station Records
#'
#' Determines the set of records that are the five highest, and five lowest, annual rainfall records in the
#' extremes table
#'
#' @param extremes: The dataframe of annual rainfall records per station, which must include 
#'                  the 'stationID' field, and the 'year' and 'total' fields
#' @param stations: The dataframe of weather stations, which must include the 'stationID' & 'name' fields
#'
#' @return A named list of 2 dataframes: (1) 'highest' = highest (2) 'lowest' = lowest
#'
HLAS <- function (extremes, stations) {

  # Joining the extremes & stations tables
  joined <- left_join(x = extremes, y = stations[, c('stationID', 'name')], by = 'stationID', keep = FALSE)

  # Ordering the resulting table in descending order w.r.t. total, i.e., total rainfall
  frame <- joined[order(-joined$total), ]

  # The five records that the highest total rainfall values
  highest <- head(frame, n = 5)

  # The five records that the lowest total rainfall values; in ascending order
  lowest <- tail(frame, n = 5) %>%
    arrange(total)

  # return
  return(list('highest' = highest, 'lowest' = lowest))

}