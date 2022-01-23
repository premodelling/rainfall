# Title     : Team B3
# Objective : Rainfall
# Created by: greyhypotheses
# Created on: 02/11/2021

# Get the rainfall readings & stations data
source(file = 'R/functions/GetData.R')

source(file = 'R/functions/RainfallAverages.R')
source(file = 'R/functions/RainfallAveragesReduce.R')
source(file = 'R/functions/RainfallExtremes.R')

source(file = 'R/graphs/AverageRainfallSpectrum.R')
source(file = 'R/graphs/AverageRainfallRaster.R')
source(file = 'R/graphs/AverageRainfallTrend.R')

source(file = 'R/functions/HighestIndividualReadings.R')
source(file = 'R/functions/HLAS.R')
source(file = 'R/functions/WettestMonthTallies.R')


frames <- GetData()
readings <- frames$readings
stations <- frames$stations
rm(frames)


#' Part 1
#' Data Integration

# 1. The mean rainfall per month; each date is the first day of a month
averages <- RainfallAverages(readings = readings)

# 2. Mean rainfall by month [across all years]
reduced <- RainfallAveragesReduce(averages = averages)

# 3. Inspecting extreme rain quantities per station VIA total rainfall per station per year
extremes <- RainfallExtremes(readings = readings)


#' Part 2
#' Graphs

# 1. A line graph of mean rainfall per month
AverageRainfallTrend(averages = averages)

# 2. A matrix graph of mean rainfall per month of each year
AverageRainfallRaster(averages = averages)

# 3. A bar graph of the mean rainfall by month [across all years]
AverageRainfallSpectrum(reduced = reduced)


#' Part 3
#' Extreme Tables

# Highest Individual Readings
hir <- HighestIndividualReadings(readings = readings, stations = stations)
view(hir, title = 'Highest Individual Readings')

# The records that have the highest & lowest annual rainfall records
hlas <- HLAS(extremes = extremes, stations = stations)
view(hlas$highest, title = 'Highest Annual Rainfall Records')
view(hlas$lowest, title = 'Lowest Annual Rainfall Records')

# Wettest Month Records / Tallies
wmt <- WettestMonthTallies(readings = readings)
view(wmt, title = 'Wettest Months')


