# Title     : Rainfall Averages
# Objective : The average rainfall per date w.r.t. stations across Lancaster
# Created by: Think
# Created on: 02/11/2021

#' Rainfall Averages
#'
#' The mean rainfall per month; each date is the first day of a month
#'
#' @param readings: The dataframe of rainfall readings
#'
RainfallAverages <- function (readings) {

  averages <- readings %>%
    group_by(date, year, month) %>%
    summarise(mean_rainfall_month = mean(rain), .groups = 'drop')

  return(averages)
}