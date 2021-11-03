# Title     : Rainfall Averages
# Objective : The average rainfall per date w.r.t. stations across Lancaster
# Created by: Think
# Created on: 02/11/2021

RainfallAverages <- function (data) {
  averages <- readings %>%
    group_by(date, year, month, month_code) %>%
    summarise(mean_rainfall_month = mean(rain), .groups = 'drop')

  return(averages)
}