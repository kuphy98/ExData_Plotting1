# Omitted the estimation of memory usage <= plot1.R

# Reading whole data
whole_data <- read.table("./household_power_consumption.txt", header=T, 
                         sep=";", na.strings="?", stringsAsFactors=FALSE)

# subsetting
data <- whole_data[whole_data$Date %in% c("1/2/2007", "2/2/2007"),]
rm(whole_data)

# Plot 4. lattice: 
# (Global Active Power, Voltage, Energy sub metering, Global reactive power) vs. date/time

# re-formatting
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# dividing plotting areas
par(mar=c(4,5,2,1))
par(mfrow=c(2,2))

# 1
plot(datetime, data$Global_active_power, xlab='', ylab="Global Active Power", type='l', lwd=1.5)

# 2
plot(datetime, data$Voltage, xlab='datetime', ylab="Voltage", type='l', lwd=1.5)

# 3
#meter1 <- as.numeric(data$Sub_metering_1)
#meter2 <- as.numeric(data$Sub_metering_2)
#meter3 <- as.numeric(data$Sub_metering_3)

#plot(datetime, meter1, type='l', ylab="Energy sub metering", xlab='', lwd=2)
#lines(datetime, meter2, type='l', col='red', lwd=2)
#lines(datetime, meter3, type='l', col='blue', lwd=2)

plot(datetime, data$Sub_metering_1, type='l', ylab="Energy sub metering", xlab='', lwd=2)
lines(datetime, data$Sub_metering_2, type='l', col='red', lwd=2)
lines(datetime, data$Sub_metering_3, type='l', col='blue', lwd=2)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=1, col=c("black", "red", "blue"), cex = 0.5, bty='n')

# 4
plot(datetime, data$Global_reactive_power, xlab='datetime', ylab="Global_reactive_power", type='l', lwd=1.5)

dev.copy(png, file="plot4.png")
dev.off()

