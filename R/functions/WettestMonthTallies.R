# Title     : Wettest Month tallies
# Objective : The annual 'month with the most rainfall crown'
# Created by: Think
# Created on: 04/11/2021

#' Wettest Month Tallies
#'
#' Determine the number of times each month takes the annual 'month with the most rainfall crown'
#'
#' @param readings: The dataframe of rainfall readings, which must include 'year', 'month', and 'rain'
#'
#' Future: Try the calculation below via the function split()
#'
WettestMonthTallies <- function (readings) {

  # Calculating the total amount of rain per month each year
  baseline <- readings %>%
    group_by(year, month) %>%
    summarise(total = sum(rain), .groups = 'drop')

  # Ordering 'baseline' by (a) year, and (b) decreasing total rainfall
  rearranged <- baseline[with(baseline, order(year, -total)), ]

  # Using !duplicated() to mark the first record of each year.  Each first record
  # is the record/month that has the highest rainfall during the year in question - due
  # to the ordering statement above
  indices <- !duplicated(rearranged$year)
  records <- rearranged[indices, ]
  
  # How many times does each month occur in 'records'?
  frequencies <- records %>%
    group_by(month) %>%
    summarise(N = n())

  # return
  return(frequencies)

}