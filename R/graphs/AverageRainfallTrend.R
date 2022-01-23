# Title     : AverageRainfallTrend.R
# Objective : Average rainfall trend
# Created by: greyhypotheses
# Created on: 23/01/2022

AverageRainfallTrend <- function (averages) {

  #    Mean Rainfall: The line graph of mean rainfall, per month,
  #    against dates during the years $1850$ to $1900$.
  #
  #    graphics::par(mar = c(2, 6, 1, 2) )
  #    mar = c(bottom, left, top, right)
  #
  graphics::frame()
  plot(x = averages$date, y = averages$mean_rainfall_month,
       type = 'l', frame.plot = FALSE, xlab = 'Date', ylab = 'Mean Rainfall per Month')

}