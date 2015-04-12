# Plot 2
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption


# Reading the data (missing values are coded as ?)
# household_power_consumption.txt must be in the same directory as this R script
epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")


# Subsetting to 2007-02-01 and 2007-02-02 dates and converting
epcdata$Date <- as.Date(epcdata$Date, format="%d/%m/%Y")
datedata <- subset(epcdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datedata$datetime <- as.POSIXct(paste(as.Date(datedata$Date), datedata$Time))


# Create plot
plot(datedata$datetime, datedata$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")


# Create the PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
