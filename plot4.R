dataset <- read.table("C:/Users/Andrew Hsu/OneDrive/Desktop/Aquarium/IT/R/exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
library(lubridate)
dataset$Date <- as.Date(parse_date_time(dataset$Date, "dmy"))
filter_1 <- dataset$Date == "2007-2-1"
filter_2 <- dataset$Date == "2007-2-2"
nd <- dataset[(filter_1 | filter_2), ]

nd$Voltage <- as.numeric(nd$Voltage)
nd$DateTime <- strptime(paste(nd$Date, nd$Time), format = "%Y-%m-%d %H:%M:%S")
v <- plot(x = nd$DateTime, y = nd$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

nd$Global_reactive_power <- as.numeric(nd$Global_reactive_power)
grp <- plot(x = nd$DateTime, y = nd$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

library(flexdashboard)