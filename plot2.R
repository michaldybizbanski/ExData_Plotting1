exdata <- subset(read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE), (Date == "1/2/2007") | (Date == "2/2/2007"))

exdata$datetime <- strptime(paste(exdata$Date, exdata$Time), "%d/%m/%Y %H:%M:%S")
exdata$GAP <- as.numeric(exdata$Global_active_power)

png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(exdata$datetime, exdata$GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
