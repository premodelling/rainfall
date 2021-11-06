# Title     : Team B3
# Objective : Rainfall ...
# Created by: Think
# Created on: 02/11/2021

# Get the rainfall readings & stations data
source('R/functions/GetData.R')
frames <- GetData()
readings <- frames$readings
stations <- frames$stations
rm(frames)



#' Part 1
#' Data Integration

# 1. The mean rainfall per month; each date is the first day of a month
averages <- readings %>%
  group_by(date, year, month) %>%
  summarise(mean_rainfall_month = mean(rain), .groups = 'drop')
averages %>%
  tibble()

# 2. Mean rainfall by month [across all years]
reduced <- averages %>%
  group_by(month) %>%
  summarise(mean = mean(mean_rainfall_month), .groups = 'drop')
reduced %>%
  tibble()

# 3. Inspecting extreme rain quantities per station VIA total rainfall per station per year
extremes <- readings %>%
  group_by(stationID, year) %>%
  summarise(total = sum(rain), .groups = 'drop')
extremes %>%
  tibble()



#' Part 2
#' Graphs

# 1. A line graph of mean rainfall per month
plot(x = averages$date, y = averages$mean_rainfall_month,
     type = 'l', frame.plot = FALSE, xlab = 'Date', ylab = 'Mean Rainfall per Month')

# 2. A matrix graph of mean rainfall per month of each year
ggplot(data = averages) +
  geom_raster(mapping = aes(x = year, y = month, fill = mean_rainfall_month )) +
  theme_minimal()

# 3. A bar graph of the mean rainfall by month [across all years]
ggplot(data = reduced) +
  geom_bar(mapping = aes(x = month, y = mean), stat = 'identity') +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 11, angle = 45),
        axis.text.y = element_text(face = "bold", size = 11),
        axis.title.y = element_text(size = 13),
        aspect.ratio = 0.65) +
  ylab(label = 'Mean Rainfall\n') +
  xlab(label = '')

barplot(reduced$mean, names.arg = reduced$month, col = 'black', las = 2,
        xlab = '\n', ylab = 'Average Rainfall', main = 'Wettest Month')



#' Part 3
#' Extreme Tables

# Highest Individual Readings
source('R/functions/HighestIndividualReadings.R')
hir <- HighestIndividualReadings(readings = readings, stations = stations)
hir %>%
  tibble()

# The records that have the highest & lowest annual rainfall records
source('R/functions/HLAS.R')
hlas <- HLAS(extremes = extremes, stations = stations)
hlas$highest %>%
  tibble()
hlas$lowest %>%
  tibble()

# Wettest Month Records / Tallies
source('R/functions/WettestMonthTallies.R')
frequencies <- WettestMonthTallies(readings = readings)
