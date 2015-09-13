# set par 2 x 2
par(mfrow = c(2,2))

# Get raw data
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
# set Date field as Date
data$Date <- as.Date( data$Date, format = "%d/%m/%Y")

# Retrieve data for the specified dates
df <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

# Change type of the Global Active Power column to double
df$Global_active_power <- as.double(df$Global_active_power)

# Create a new column containing the full date time, date + time.
df$FullTime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1
plot(df$FullTime, df$Global_active_power, pch = 26,xlab="", ylab="Global Active Power")
lines(df$FullTime, df$Global_active_power) 

# Plot 2
plot(df$FullTime, df$Voltage, pch = 26,xlab="datetime", ylab="Voltage")
lines(df$FullTime, df$Voltage, col = "black") 


# Plot 3
plot(df$FullTime, df$Sub_metering_1, pch = 26,xlab="", ylab="Energy sub metering")
lines(df$FullTime, df$Sub_metering_1, col = "black") 
lines(df$FullTime, df$Sub_metering_2, col = "red") 
lines(df$FullTime, df$Sub_metering_3, col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, 
       col=c("black", "red", "blue"), 
       cex = .4,
       bty = "n"
       )


# Plot 4
plot(df$FullTime, df$Global_reactive_power, pch = 26,xlab="datetime", ylab="Global_reactive_power")
lines(df$FullTime, df$Global_reactive_power, col = "black") 

# Save to png file
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()