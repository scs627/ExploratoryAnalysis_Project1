## Exploratory Data Analysis Week 1 Assignment

  # Read in data for the two day period
  data <- read.table("assignment1data/household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880)
  names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  # Format dates
  library(lubridate)
  newcolumn <- paste(data$Date, data$Time, sep = " ")
  formatted <- dmy_hms(newcolumn)

  # Make plot and save as PNG file
  png("plot2.png")
  plot(formatted, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )
  dev.off()