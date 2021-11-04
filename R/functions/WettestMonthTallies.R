# Title     : The wettest months
# Objective : The wettest months
# Created by: Think
# Created on: 04/11/2021

WettestMonthTallies <- function (readings) {

  baseline <- readings %>%
    group_by(year, month) %>%
    summarise(total_rainfall = sum(rain), .groups = 'drop')

  ordered_baseline <- baseline[with(baseline, order(year, -total_rainfall)), ]

  indices <- !duplicated(ordered_baseline$year)
  wettest_months_per_year <- ordered_baseline[indices, ]

  frequencies <- wettest_months_per_year %>%
    group_by(month) %>%
    summarise(N = n())

  return(frequencies)

}