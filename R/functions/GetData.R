# Title     : Get Data
# Objective : Reads the Rainfall & Stations Data
# Created by: Think
# Created on: 02/11/2021

#' Get Data
#'
#' Reads the (a) rainfall readings data file, and (b) the weather stations data file.  The
#' rainfall readings were taken at the wether stations.
#'
#' @return A named list of 2 dataframes: (1) 'readings' = readings (2) 'stations' = stations
GetData <- function() {


  # **Rainfall**

  # Reading-in the rainfall data
  readings <- read.csv('data/readings.csv')

  # Months order
  levels_ <- c('January', 'February', 'March', 'April', 'May', 'June', 'July',
               'August', 'September', 'October', 'November', 'December')

  # Coverting the filed of month to factors, and defining the order of the factors
  readings$month <- factor(readings$month, levels = levels_)

  # Creating a field of dates [string format]
  readings$textdate <- paste0(readings$year, '-', readings$month, '-', '01')

  # Creating the Date format of date string <textdate>
  readings$date <- as.Date(readings$textdate, format = '%Y-%B-%d')



  # **Stations**

  # Reading in the stations data
  stations <- read.csv('data/stations.csv')
  if (anyDuplicated(stations$stationID)) {
    stop('The station codes are not unique')
  }



  # **Return**

  # Do all stations in readings have a stations record
  if (!all(readings$stationID %in% stations$stationID)) {
    stop('There are stations in data file readings that do not have a record in the stations catalogue')
  } else {
    return(list('readings' = readings, 'stations' = stations))
  }

}