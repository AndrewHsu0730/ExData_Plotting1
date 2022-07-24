dataset <- read.table("C:/Users/Andrew Hsu/OneDrive/Desktop/Aquarium/IT/R/exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
library(lubridate)
dataset$Date <- as.Date(parse_date_time(dataset$Date, "dmy"))
filter_1 <- dataset$Date == "2007-2-1"
filter_2 <- dataset$Date == "2007-2-2"
nd <- dataset[(filter_1 | filter_2), ]

nd$Sub_metering_1 <- as.numeric(nd$Sub_metering_1)
nd$Sub_metering_2 <- as.numeric(nd$Sub_metering_2)
nd$Sub_metering_3 <- as.numeric(nd$Sub_metering_3)
nd$DateTime <- strptime(paste(nd$Date, nd$Time), format = "%Y-%m-%d %H:%M:%S")
plot(x = nd$DateTime, y = nd$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = nd$DateTime, y = nd$Sub_metering_2, type = "l", col = "red")
lines(x = nd$DateTime, y = nd$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8)