## Exploratory Data Analysis Project 1 Plot 1 ##

dat <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

# Read the data and extract the parts we want to work with
dat1 <- dat[dat[,1]=="1/2/2007",]
dat2 <- dat[dat[,1]=="2/2/2007",]
dat3 <- rbind(dat1, dat2)
hist(dat3$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
