# Plot 4
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption


# Reading the data (missing values are coded as ?)
# household_power_consumption.txt must be in the same directory as this R script
epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")


# Subsetting to 2007-02-01 and 2007-02-02 dates and converting
epcdata$Date <- as.Date(epcdata$Date, format="%d/%m/%Y")
datedata <- subset(epcdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datedata$datetime <- as.POSIXct(paste(as.Date(datedata$Date), datedata$Time))


# Create 2x2 plot
par(mfrow = c(2, 2))

# Create plot 1/4
plot(datedata$datetime, datedata$Global_active_power, xlab="", ylab="Global Active Power", type="l")

# Create plot 2/4
plot(datedata$datetime, datedata$Voltage, xlab="datetime", ylab="Voltage", type="l")

# Create plot 3/4
plot(datedata$datetime, datedata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
# subsets of data are plotted here using different colors
lines(datedata$datetime, datedata$Sub_metering_2, type="l", col="Red")
lines(datedata$datetime, datedata$Sub_metering_3, type="l", col="Blue")
legend("topright", lty=1, bty="n", cex=0.7, col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Create plot 4/4
plot(datedata$datetime, datedata$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")


# Create the PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
