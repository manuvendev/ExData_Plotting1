par(mfrow = c(1,1))
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data$Date <- as.Date( data$Date, format = "%d/%m/%Y")
df <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
View(head(df))
df$Global_active_power   <- as.double(df$Global_active_power)
View(head(df))

df$FullTime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

plot(df$FullTime, df$Global_active_power, pch = 26,xlab="", ylab="Global Active Power (kilowatts)")
lines(df$FullTime, df$Global_active_power) 

# Save to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()

# 01: thursday
# 02: friday
