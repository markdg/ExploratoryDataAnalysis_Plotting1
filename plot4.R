## Exploratory Data Analysis Project 1 Plot 4 ##
# Assumes the data has been downloaded and unzipped in the working directory

# Read in the data
dat <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

# Read the data and extract the parts we want to work with
dat1 <- dat[dat[,1]=="1/2/2007",]
dat2 <- dat[dat[,1]=="2/2/2007",]
dat3 <- rbind(dat1, dat2)

# Combine Date and Time to use for the plot
DateTime <- strptime(paste(dat3$Date, dat3$Time), "%d/%m/%Y %H:%M") 

# Set up multiplot parameters
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# Make the 4 plots
with(dat3, {
  plot(DateTime, Global_active_power, pch="", xlab="", ylab="Global Active Power")
  lines(DateTime, dat3$Global_active_power)
  plot(DateTime, Voltage, pch="", xlab="datetime", ylab="Voltage")
  lines(DateTime, dat3$Voltage)
  plot(DateTime, Sub_metering_1, pch="", xlab="", ylab="Energy sub metering")
  lines(DateTime, dat3$Sub_metering_1)
  lines(DateTime, dat3$Sub_metering_2, col="red")
  lines(DateTime, dat3$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))
  plot(DateTime, Global_reactive_power, pch="", xlab="datetime")
  lines(DateTime, dat3$Global_reactive_power)
})

# Copy it to a PNG file
dev.copy(png, file="plot4.png")
dev.off()
