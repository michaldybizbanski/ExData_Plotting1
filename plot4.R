exdata <- subset(read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE), (Date == "1/2/2007") | (Date == "2/2/2007"))

exdata$datetime <- strptime(paste(exdata$Date, exdata$Time), "%d/%m/%Y %H:%M:%S")
exdata$GAP <- as.numeric(exdata$Global_active_power)
exdata$Sub_1 <- as.numeric(gsub("?", NA, exdata$Sub_metering_1, fixed = TRUE))
exdata$Sub_2 <- as.numeric(gsub("?", NA, exdata$Sub_metering_2, fixed = TRUE))
exdata$Sub_3 <- as.numeric(gsub("?", NA, exdata$Sub_metering_3, fixed = TRUE))

png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfcol = c(2,2))

plot(exdata$datetime, exdata$GAP, type = "l", xlab = "", ylab = "Global Active Power")

plot(exdata$datetime, exdata$Sub_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(exdata$datetime, exdata$Sub_2, type = "l", col = "red", xlab = "", ylab = "")
lines(exdata$datetime, exdata$Sub_3, type = "l", col = "blue", xlab = "", ylab = "")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, bty="n")

with(exdata, plot(datetime, Voltage, type = "l"))

with(exdata, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
