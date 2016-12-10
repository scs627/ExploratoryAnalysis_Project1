## Exploratory Data Analysis Week 1 Assignment

# Read in data for the two day period
data <- read.table("assignment1data/household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Format dates
library(lubridate)
newcolumn <- paste(data$Date, data$Time, sep = " ")
formatted <- dmy_hms(newcolumn)

# Set up to have a 2 x 2 grid of plots
png("plot4.png")
par(mfcol = c(2,2))

# Add plot 1
plot(formatted, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )

# Add plot 2
plot(formatted, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(formatted, data$Sub_metering_2, type = "l", col = "red")
lines(formatted, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# Add plot 3
plot(formatted, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Add plot 4
plot(formatted, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
