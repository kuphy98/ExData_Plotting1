# Omitted the estimation of memory usage <= plot1.R

# Reading whole data
whole_data <- read.table("./household_power_consumption.txt", header=T, 
                         sep=";", na.strings="?", stringsAsFactors=FALSE)
str(whole_data)
# subsetting
data <- whole_data[whole_data$Date %in% c("1/2/2007", "2/2/2007"),]
str(data)
rm(whole_data)
plot.new()
par(mfrow=c(1,1))

# Plot 3. Energy sub metering vs. Date
par(mar=c(4,4,2,1))

# re-formatting Date, Time variables
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
str(data)

plot(datetime, data$Sub_metering_1, type='l', ylab="Energy sub metering", xlab='', lwd=2)
lines(datetime, data$Sub_metering_2, type='l', col='red', lwd=2)
lines(datetime, data$Sub_metering_3, type='l', col='blue', lwd=2)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1, col=c("black", "red", "blue"), 
       cex = 0.65)

dev.copy(png, file="plot3.png")
dev.off()



