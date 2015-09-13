#This file will generate plot 2 for Exploratory Data Analysis Project 1.

power_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power_consumption$Date <- paste(power_consumption$Date,power_consumption$Time,sep=" ")
power_consumption$Date <- strptime(power_consumption$Date, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
power_consumption <- power_consumption[power_consumption$Date >= strptime("2007-02-01", format="%Y-%m-%d", tz="UTC"),]
power_consumption <- power_consumption[power_consumption$Date < strptime("2007-02-03", format="%Y-%m-%d", tz="UTC"),]
png(file="plot2.png")
par(mfrow = c(1,1), pty = "m")
plot(power_consumption$Date,power_consumption$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()