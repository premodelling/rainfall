# Title     : AverageRainfallSpectrum.R
# Objective : Each month's average rainfall across the years
# Created by: greyhypotheses
# Created on: 23/01/2022


#' Average Rainfall Spectrum
#'
#' An alternative:
#'      barplot(reduced$mean, names.arg = reduced$month, col = 'black', las = 2,
#'      xlab = '\n', ylab = 'Average Rainfall', main = 'Wettest Month')
#'
AverageRainfallSpectrum <- function (reduced) {


  #    The Mean Rainfall per Month Across the Years: Each bar represents the mean
  #    amount of rainfall that fell, during the named month, across the years 1850 to 1900.
  graphics::frame()
  ggplot(data = reduced, mapping = aes(x = month, y = mean)) +
    geom_bar(stat = 'identity') +
    geom_text(mapping = aes(label  = round(mean, digits = 1)), vjust = 0, nudge_y = 0.25) +
    theme_minimal() +
    theme(axis.text.x = element_text(size = 11, angle = 90),
          axis.text.y = element_text(face = "bold", size = 11),
          axis.title.y = element_text(size = 13),
          aspect.ratio = 0.65) +
    ylab(label = 'Mean Rainfall\n') +
    xlab(label = '')

}