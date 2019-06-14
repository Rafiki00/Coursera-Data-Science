power <- read.table("household_power_consumption.txt", nrows=2880, skip=66637, sep=";", na.strings = "?")
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

power[,"Date"] <- as.Date(power[,"Date"], "%d/%m/%Y")
power$datetime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(power$datetime, power$Global_active_power, type="l", ylab="Global active power", xlab="")

plot(power$datetime, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(power$datetime, power$Sub_metering_1, type="l")
points(power$datetime, power$Sub_metering_2, type="l", col=2)
points(power$datetime, power$Sub_metering_3, type="l", col=4)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), ncol = 1, lty=c(1, 1, 1), col=c(1, 2, 4))

plot(y=power$Voltage, x=power$datetime, xlab="datetime", ylab="Voltage", type="l")

plot(y=power$Global_reactive_power, x=power$datetime, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()