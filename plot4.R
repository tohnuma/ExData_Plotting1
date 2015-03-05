setwd("~/R/Coursera/exploratory data analysis")
library(lubridate)

hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc_full <- mutate(hpc_full, Date = dmy(hpc_full$Date))

## Subsetting the data
data <- subset(hpc_full, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))
#dim: 2880 9

## Converting dates
newdate <- ymd_hms(paste(data$Date, data$Time))

par(mfrow=c(2,2))
##Top-left
plot(data$Global_active_power ~ newdate, type="l", xlab="", ylab="Global Active Power")

##Top-right
plot(data$Voltage ~ newdate, type="l", xlab="datetime", ylab="Voltage")

##Bottom-left
plot(data$Sub_metering_1 ~ newdate, type="l", xlab="", ylab="Energy sub metering", 
     col="black")
lines(newdate, data$Sub_metering_2, type="l", col="red")
lines(newdate, data$Sub_metering_3, type="l", col="blue")
with(data, legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1,
                  bty="n", col=c("black", "red", "blue")))

##Bottom-right
plot(data$Global_reactive_power ~ newdate, type="l", xlab="datetime", ylab="Global_reactive_power")

##Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

