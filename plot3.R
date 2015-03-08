# Read data
data <- read.csv("household_power_consumption.txt", sep = ";")

# Subset to dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Add new timestamp column to data frame
data <- within(data, { timestamp=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") })

# Open png graphics device
png(file = "plot3.png", width = 480, height = 480, units = "px")

# Create plot
with(data, {
    plot(timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(timestamp, Sub_metering_2, col = "red")
    lines(timestamp, Sub_metering_3, col = "blue")
} )
legend("topright", lty = 1, col = c("black", "red", "blue"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close png graphics device
dev.off()