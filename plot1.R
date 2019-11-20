data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = '?')

data1 = subset(data, Date == "1/2/2007")
data2 = subset(data, Date == "2/2/2007")
#dim(data1)
#dim(data2)

data = rbind(data1, data2)
#dim(data)
png(filename = "1.1.png", width = 480, height = 480, units = 'px')
# transform factor into numeric
with(data, hist(Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "GLobal Active Power"))

dev.off()

