# Title     : AverageRainfallRaster.R
# Objective : A raster of average rainfall
# Created by: greyhypotheses
# Created on: 23/01/2022

AverageRainfallRaster <- function (averages) {

  #    A Raster Representation of Mean Rainfall: A raster representation
  #    of mean rainfall per month every year; for the years $1850$ to $1900$.
  #
  #    graphics::par(mar = c(1, 6, 1, 2) )
  #    mar = c(bottom, left, top, right)
  #
  graphics::frame()
  ggplot(data = averages) +
    geom_raster(mapping = aes(x = year, y = month, fill = mean_rainfall_month )) +
    theme_minimal()

}