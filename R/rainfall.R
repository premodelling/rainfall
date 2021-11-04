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


# The mean rainfall by date
averages <- readings %>%
  group_by(date, year, month, month_code) %>%
  summarise(mean_rainfall_month = mean(rain), .groups = 'drop')


# Wettest month
# Instead of arrange ... wettest[order(wettest$month_code), ]
wettest <- averages %>%
  group_by(month, month_code) %>%
  summarise(mean = mean(mean_rainfall_month), .groups = 'drop') %>%
  arrange(month_code)



# Inspecting extreme rain quantities per station
extremes <- readings %>%
  group_by(stationID, year) %>%
  summarise(total = sum(rain), .groups = 'drop')
extremes %>%
  tibble()


#' Graphs
plot(x = averages$date, y = averages$mean_rainfall_month,
     type = 'l', frame.plot = FALSE, xlab = 'Date', ylab = 'Mean Rainfall per Month')

ggplot(data = averages) +
  geom_raster(mapping = aes(x = year, y = month, fill = mean_rainfall_month )) +
  theme_minimal()

ggplot(data = wettest) +
  geom_bar(mapping = aes(x = month, y = mean), stat = 'identity') +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 11, angle = 45),
        axis.text.y = element_text(face = "bold", size = 11),
        axis.title.y = element_text(size = 13),
        aspect.ratio = 0.65) +
  ylab(label = 'Mean Rainfall\n') +
  xlab(label = '')

barplot(wettest$mean, names.arg = wettest$month, col = 'black', las = 2,
        xlab = '\n', ylab = 'Average Rainfall', main = 'Wettest Month')





#' Part 2
#' Extreme Tables

# Highest Individual Readings
expanded <- left_join(x = readings, y = stations, by = 'stationID', keep = FALSE)
expanded_ <- expanded[order(-expanded$rain), ]
expanded_ %>%
  tibble()
head(expanded_, n = 5)


# H & L Annual Stations
extremes_ <- left_join(x = extremes, y = stations[, c('stationID', 'name')], by = 'stationID', keep = FALSE)
extremes_ <- extremes_[order(-extremes_$total), ]
head(extremes_, n = 5)

lowest_set <- tail(extremes_, n = 5) %>%
  arrange(total)
lowest_set


# Wettest Month Records / Tallies
# split - probably the best
baseline <- readings %>%
  group_by(year, month) %>%
  summarise(total_rainfall = sum(rain), .groups = 'drop')

ordered_baseline <- baseline[with(baseline, order(year, -total_rainfall)), ]

indices <- !duplicated(ordered_baseline$year)
wettest_months_per_year <- ordered_baseline[indices, ]

wettest_months_per_year %>%
  group_by(month) %>%
  summarise(N = n())







































