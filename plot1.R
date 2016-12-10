## Exploratory Data Analysis Week 1 Assignment

# Read in data for the two day period
data <- read.table("assignment1data/household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
# Make histogram of Global Active Power and save as PNG file
png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))
dev.off()

