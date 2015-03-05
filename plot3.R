setwd("~/R/Coursera/exploratory data analysis")
library(lubridate)

hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc_full <- mutate(hpc_full, Date = dmy(hpc_full$Date))

## Subsetting the data
data <- subset(hpc_full, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))
#dim: 2880 9

## Converting dates
newdate <- ymd_hms(paste(data$Date, data$Time))

##plot3
plot(data$Sub_metering_1 ~ newdate, type="l", xlab="", ylab="Energy sub metering", 
     col="black")
lines(newdate, data$Sub_metering_2, type="l", col="red")
lines(newdate, data$Sub_metering_3, type="l", col="blue")

# legend
with(data, legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
                  lty=1, lwd=1, col=c("black", "red", "blue")))

## saving to file 
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

