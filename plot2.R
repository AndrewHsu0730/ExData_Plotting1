dataset <- read.table("C:/Users/Andrew Hsu/OneDrive/Desktop/Aquarium/IT/R/exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
library(lubridate)
dataset$Date <- as.Date(parse_date_time(dataset$Date, "dmy"))
filter_1 <- dataset$Date == "2007-2-1"
filter_2 <- dataset$Date == "2007-2-2"
nd <- dataset[(filter_1 | filter_2), ]

nd$Global_active_power <- as.numeric(nd$Global_active_power)
nd$DateTime <- strptime(paste(nd$Date, nd$Time), format = "%Y-%m-%d %H:%M:%S")
plot(nd$DateTime, nd$Global_active_power, "l", xlab = "Day", ylab = "Global Active Power (kilowatts)")