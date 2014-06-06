## Exploratory Data Analysis Project 1 Plot 3 ##
# Assumes the data has been downloaded and unzipped in the working directory

# Read in the data
dat <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

# Extract the the data for the two days of interest and combine them
dat1 <- dat[dat[,1]=="1/2/2007",]
dat2 <- dat[dat[,1]=="2/2/2007",]
dat3 <- rbind(dat1, dat2)

# Combine Date and Time to use for the plot
DateTime <- strptime(paste(dat3$Date, dat3$Time), "%d/%m/%Y %H:%M") 

# Plot with dimensionless plot character then add line plots
with(dat3, plot(DateTime, Sub_metering_1, pch="", xlab="", ylab="Energy sub metering"))
lines(DateTime, dat3$Sub_metering_1)
lines(DateTime, dat3$Sub_metering_2, col="red")
lines(DateTime, dat3$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))

# Copy it to a PNG file
dev.copy(png, file="plot3.png")
dev.off()
