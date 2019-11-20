data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = '?')

data1 = subset(data, Date == "1/2/2007")
data2 = subset(data, Date == "2/2/2007")
#dim(data1)
#dim(data2)

data = rbind(data1, data2)
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
png(filename = "plot4.png", width = 480, height = 480, units = 'px')
par(mfrow = c(2, 2))

with(data, {
	plot(DateTime, Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l')
	plot(DateTime, Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
	plot(DateTime, Sub_metering_1, yaxt = 'n', xlab = '', ylab = "Energy sub metering", type = 'l')
	axis(2, at = c(0, 10, 20, 30))
	lines(DateTime, Sub_metering_2, col = 'red')
	lines(DateTime, Sub_metering_3, col = 'blue')
	legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1, lwd = 2)
	plot(DateTime, Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
})

dev.off()
