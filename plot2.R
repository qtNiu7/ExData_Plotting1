data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = '?')

data1 = subset(data, Date == "1/2/2007")
data2 = subset(data, Date == "2/2/2007")
#dim(data1)
#dim(data2)

data = rbind(data1, data2)
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

png(filename = 'plot2.png', width = 480, height = 480, units = 'px') 

plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power(kilowatts)', type = 'l')
#with(data, plot(DateTime, Global_acitve_power))
dev.off()
