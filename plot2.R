setwd("~/R/Coursera/exploratory data analysis")
library(lubridate)

hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc_full <- mutate(hpc_full, Date = dmy(hpc_full$Date))

## Subsetting the data
data <- subset(hpc_full, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))
#dim: 2880 9

## Converting dates
newdate <- ymd_hms(paste(data$Date, data$Time))

##plot2
plot(data$Global_active_power ~ newdate, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

