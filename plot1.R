# Estimating memory usage
top.size <- object.size(read.csv("household_power_consumption.txt", nrow=1000))
top.size
lines <- as.numeric(gsub("[^0-9]", "", system("wc -l household_power_consumption.txt", intern=T)))
lines
size.estimate <- lines / 1000 * top.size
size.estimate # ~315 MB

# Reading whole data
whole_data <- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=FALSE)

# subsetting
data <- whole_data[whole_data$Date %in% c("1/2/2007", "2/2/2007"),]
rm(whole_data)

# plotting a histogram
par(mar=c(5.1, 4.1, 4.1, 2.1), oma=c(1,1,1,0))

#hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", lwd = 3, main="Global Active Power")
hist(data$Global_active_power, col="red", xlab="", ylab="", lwd = 3, main="Global Active Power")
title(xlab="Global Active Power (kilowatts)", mgp=c(3,1,0))
title(ylab="Frequency", mgp=c(3,1,0))

dev.copy(png, file="plot1.png")
dev.off()





