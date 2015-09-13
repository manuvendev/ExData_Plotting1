par(mfrow = c(1,1))
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data$Date <- as.Date( data$Date, format = "%d/%m/%Y")
df <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
df$Global_active_power   <- as.double(df$Global_active_power)
df$FullTime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

#
plot(df$FullTime, df$Sub_metering_1, pch = 26,xlab="", ylab="Energy sub metering",ylim=c(0,30))
lines(df$FullTime, df$Sub_metering_1, col = "black") 
lines(df$FullTime, df$Sub_metering_2, col = "red") 
lines(df$FullTime, df$Sub_metering_3, col = "blue") 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

# Save to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()
# 01: thursday
# 02: friday
