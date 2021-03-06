#This file will generate plot 4 for Exploratory Data Analysis Project 1.

power_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power_consumption$Date <- paste(power_consumption$Date,power_consumption$Time,sep=" ")
power_consumption$Date <- strptime(power_consumption$Date, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
power_consumption <- power_consumption[power_consumption$Date >= strptime("2007-02-01", format="%Y-%m-%d", tz="UTC"),]
power_consumption <- power_consumption[power_consumption$Date < strptime("2007-02-03", format="%Y-%m-%d", tz="UTC"),]
png(file="plot4.png")
par(mfrow = c(2,2), pty = "m")
#Top left plot
plot(power_consumption$Date,power_consumption$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#Top right plot
plot(power_consumption$Date,power_consumption$Voltage,type="l",xlab="datetime",ylab="Voltage")

#Bottom left plot
plot(power_consumption$Date,power_consumption$Sub_metering_1, type="l",xlab="",ylab="Energy Sub Metering",ylim = c(0,max(power_consumption[,7:9])))
lines(power_consumption$Date, power_consumption$Sub_metering_2,col = "Red")
lines(power_consumption$Date, power_consumption$Sub_metering_3,col = "Blue")
legend("topright", legend = colnames(power_consumption[,7:9]), bty = "n", col=c("Black","Red","Blue"), lwd = 1)

#Bottom right plot
plot(power_consumption$Date,power_consumption$Global_reactive_power ,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()