# Set plotting allocation
par(mfrow = c(1,1))

# Get data from text file
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors=FALSE, dec=".")

# Transform date field
data$Date <- as.Date( data$Date, format = "%d/%m/%Y")

# Subset data according to the desired dates
df <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

# Change global active power column type
df$Global_active_power  <- as.numeric(df$Global_active_power)

# Create datetime to plot time series.
df$FullTime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

# Plot
plot(df$FullTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()

