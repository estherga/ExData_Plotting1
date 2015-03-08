# Read data
data <- read.csv("household_power_consumption.txt", sep = ";")

# Subset to dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Open png graphics device
png(file = "plot1.png", width = 480, height = 480, units = "px")

# Create plot
hist(data$Global_active_power, main = "Global Active Power", col = "Red", xlab = "Global Active Power (kilowatts)")

# Close png graphics device
dev.off()