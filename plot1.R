## Exploratory Data Analysis Project 1 Plot 1 ##
# Assumes the data has been downloaded and unzipped in the working directory

# Read in the data
dat <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

# Extract the data for the two days of interest and combine them
dat1 <- dat[dat[,1]=="1/2/2007",]
dat2 <- dat[dat[,1]=="2/2/2007",]
dat3 <- rbind(dat1, dat2)

# Plot the histogram
hist(dat3$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Copy the plot to a PNG file
dev.copy(png, file="plot1.png")
dev.off()
