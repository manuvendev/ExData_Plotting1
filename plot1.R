data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data$Date <- as.Date( data$Date, format = "%d/%m/%Y")
df <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
View(head(data))
df$Global_active_power   <- as.double(df$Global_active_power)
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Save to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()