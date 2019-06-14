power <- read.table("household_power_consumption.txt", nrows=2880, skip=66637, sep=";", na.strings = "?")
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

Sys.setlocale("LC_TIME", "en_US")
power[,"Date"] <- as.Date(power[,"Date"], "%d/%m/%Y")
power$datetime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(power$datetime, power$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab="")
dev.off()