exdata <- subset(read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE), (Date == "1/2/2007") | (Date == "2/2/2007"))

exdata$GAP <- as.numeric(exdata$Global_active_power)

png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(exdata$GAP, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
