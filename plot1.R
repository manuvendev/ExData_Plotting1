# Set plotting allocation
par(mfrow = c(1,1))

# Get Data from txt file
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors=FALSE, dec=".")

# Fix hour format and set column as date
data$Date <- as.Date( data$Date, format = "%d/%m/%Y")

# Subset the data frame for the desired dates
df <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

# Plot historgram
hist(as.numeric(df$Global_active_power), 
     col = "red", 
     xlab = "", 
     ylab = "", 
     main = "Global Active Power"
     )
title(xlab="Global Active Power (kilowatts)", cex.lab = .7)
title(ylab="Frequency", cex.lab = .7)


# Save to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
