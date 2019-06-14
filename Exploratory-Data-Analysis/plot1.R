power <- read.table("household_power_consumption.txt", nrows=2880, skip=66637, sep=";", na.strings = "?")
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png("plot1.png", width=480, height=480)
hist(power$Global_active_power, col=2, xlab="Global active power (kilowatts)", main="Global Active Power")
dev.off()