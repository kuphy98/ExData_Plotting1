# Omitted the estimation of memory usage <= plot1.R

# Reading whole data
whole_data <- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=FALSE)

# subsetting
data <- whole_data[whole_data$Date %in% c("1/2/2007", "2/2/2007"),]
rm(whole_data)

# Plot 2. Global Active Power vs. Date

# re-formating Date, Time variables
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
str(datetime)

par(mar=c(2, 4, 2, 2), oma=c(1,1,1,0))
with(data, plot(datetime, Global_active_power, type='l', 
                xlab = '', ylab = 'Global Active Power (kilowatts)', lwd = 2))

dev.copy(png, file="plot2.png")
dev.off()







