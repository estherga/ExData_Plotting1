# Read data
data <- read.csv("household_power_consumption.txt", sep = ";")

# Subset to dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Add new timestamp column to data frame
data <- within(data, { timestamp=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") })

# Open png graphics device
png(file = "plot4.png", width = 480, height = 480, units = "px")

# Create plot
par(mfrow = c(2, 2))
with(data, {
    plot(timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    
    plot(timestamp, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    plot(timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(timestamp, Sub_metering_2, col = "red")
    lines(timestamp, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.9)
    
    plot(timestamp, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
} )

# Close png graphics device
dev.off()