# Title     : Rainfall Averages Reduce
# Objective : Determine the average rainfall per month [across all years]
# Created by: Think
# Created on: 02/11/2021

#' Rainfall Averages Reduce
#'
#' The mean rainfall by month [across all years]
#'
#' @param averages: A dataframe wherein each record is the mean rainfall of a month of a year
#'
#' @return A dataframe of 12 records.  Each record includes the average amount of rainfall
#'         a month has had [across all years]
#'
RainfallAveragesReduce <- function (averages) {
  
  reduced <- averages %>%
    group_by(month) %>%
    summarise(mean = mean(mean_rainfall_month), .groups = 'drop')

  return(reduced)

}