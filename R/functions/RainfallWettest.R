# Title     : The Wettest Months
# Objective : Determine the wettest month via average rainfall per month data (covering a few years)
# Created by: Think
# Created on: 02/11/2021

#'
#'
#' The mean rainfall by month [across all years]
#'
RainfallWettest <- function (averages) {

  # Wettest month
  wettest <- averages %>%
    group_by(month) %>%
    summarise(mean = mean(mean_rainfall_month), .groups = 'drop')

  return(wettest)

}