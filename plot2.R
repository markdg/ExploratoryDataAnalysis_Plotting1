## Exploratory Data Analysis Project 1 Plot 2 ##

dat <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

# Read the data and extract the parts we want to work with
dat1 <- dat[dat[,1]=="1/2/2007",]
dat2 <- dat[dat[,1]=="2/2/2007",]
dat3 <- rbind(dat1, dat2)

# Combine Date and Time to use for the plot
DateTime <- strptime(paste(dat3$Date, dat3$Time), "%d/%m/%Y %H:%M") 

# Plot it with dimensionless plot character and then add lines
with(dat3, plot(DateTime, Global_active_power, pch="", xlab="", ylab="Global Active Power (kilowatts)"))
lines(DateTime, dat3$Global_active_power)

# Copy it to PNG file
dev.copy(png, file="plot2.png")
dev.off()
