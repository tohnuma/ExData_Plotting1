setwd("~/R/Coursera/exploratory data analysis")
library(lubridate)
library(dplyr)
hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Converting dates
hpc_full <- mutate(hpc_full, Date = dmy(hpc_full$Date))

## Subsetting the data
data <- subset(hpc_full, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))
#dim: 2880 9

## Plot 1
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
