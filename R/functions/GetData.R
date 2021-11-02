# Title     : Get Data
# Objective : Reads the Rainfall & Stations Data
# Created by: Think
# Created on: 02/11/2021

GetData <- function() {

  levels_ <- c('January', 'February', 'March', 'April', 'May', 'June', 'July',
               'August', 'September', 'October', 'November', 'December')

  # Rainfall readings
  readings <- read.csv('data/readings.csv')
  readings$month <- factor(readings$month, levels = levels_)
  readings$textdate <- paste0(readings$year, '-', readings$month, '-', '01')
  readings$date <- as.Date(readings$textdate, format = '%Y-%B-%d')
  readings$month_code <- format(readings$date, format = '%m')


  # Stations
  stations <- read.csv('data/stations.csv')
  anyDuplicated(stations$stationID)


  # Do all stations in readings have a stations record
  if (!all(readings$stationID %in% stations$stationID)) {
    stop('There are stations in data file readings that do not have a record in the stations catalogue')
  } else {
    return(list('readings' = readings, 'stations' = stations))
  }

}