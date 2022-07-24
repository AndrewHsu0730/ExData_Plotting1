dataset <- read.table("C:/Users/Andrew Hsu/OneDrive/Desktop/Aquarium/IT/R/exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
library(lubridate)
dataset$Date <- as.Date(parse_date_time(dataset$Date, "dmy"))
filter_1 <- dataset$Date == "2007-2-1"
filter_2 <- dataset$Date == "2007-2-2"
nd <- dataset[(filter_1 | filter_2), ]

nd$Global_active_power <- as.numeric(nd$Global_active_power)
hist(nd$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")