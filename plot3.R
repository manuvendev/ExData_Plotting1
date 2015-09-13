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

# Plot first sub metering and set plot values
plot(df$FullTime, as.numeric(df$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering", yaxt = "n")

# Add second metering in red color
lines(df$FullTime, as.numeric(df$Sub_metering_2), type="l", col = "red") 

# Add third metering in blue color
lines(df$FullTime, as.numeric(df$Sub_metering_3), type="l", col = "blue") 

# Add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

# Save to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()
