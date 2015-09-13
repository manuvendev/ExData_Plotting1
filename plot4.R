# Set plotting allocation
par(mfrow = c(2,2))

# Get data from text file
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors=FALSE, dec=".")

# Transform date field
data$Date <- as.Date( data$Date, format = "%d/%m/%Y")

# Subset data according to the desired dates
df <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

# Change column types
df$Global_active_power  <- as.numeric(df$Global_active_power)
df$Global_reactive_power  <- as.numeric(df$Global_reactive_power)
df$Voltage  <- as.numeric(df$Voltage)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

# Create datetime to plot time series.
df$FullTime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1
plot(df$FullTime, df$Global_active_power, type="l", xlab="", ylab = "")
title(ylab="Global Active Power", cex.lab = .7)

# Plot 2
plot(df$FullTime, df$Voltage, type="l", xlab="", ylab="")
title(xlab="datetime", cex.lab = .7)
title(ylab="Voltage", cex.lab = .7)

# Plot 3
plot(df$FullTime, df$Sub_metering_1, type="l",xlab="", ylab="")
title(xlab="", cex.lab = .7)
title(ylab="Energy sub metering", cex.lab = .7)
lines(df$FullTime, df$Sub_metering_2, type="l", col = "red") 
lines(df$FullTime, df$Sub_metering_3, type="l", col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, 
       col=c("black", "red", "blue"), 
       cex = .6,
       bty = "n"
       )

# Plot 4
plot(df$FullTime, df$Global_reactive_power, type = "l",xlab="", ylab="")
title(xlab="datetime", cex.lab = .7)
title(ylab="Global_reactive_power", cex.lab = .7)

# Save to png file
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()