# Title     : Extremes
# Objective : Extremes
# Created by: Think
# Created on: 04/11/2021

#' Rainfall Extremes
#'
#' Inspecting extreme rain quantities per station VIA total rainfall per station per year
#'
#' @param readings: The dataframe of rainfall readings
#'
RainfallExtremes <- function (readings) {

  extremes <- readings %>%
    group_by(stationID, year) %>%
    summarise(total = sum(rain), .groups = 'drop')

  return(extremes)
}