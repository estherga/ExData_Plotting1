# Read data
data <- read.csv("household_power_consumption.txt", sep = ";")

# Subset to dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Add new timestamp column to data frame
data <- within(data, { timestamp=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") })

# Open png graphics device
png(file = "plot2.png", width = 480, height = 480, units = "px")

# Create plot
with(data, plot(timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Close png graphics device
dev.off()