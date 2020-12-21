##Title: “plot2.R”
##Author: “Renan Portugal”
##Date: “12/14/2020”


##Loading data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## Format date to Type Date
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
##Use data from 2007-02-01 and 2007-02-02 only
subdataset <- subset(dataset,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
subdataset <- subdataset[complete.cases(subdataset),]

## Combine Date and Time column
dateTime <- paste(subdataset$Date, subdataset$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
subdataset <- subdataset[ ,!(names(subdataset) %in% c("Date","Time"))]

## Add DateTime column
t <- cbind(dateTime, t)

## Format dateTime Column
subdataset$dateTime <- as.POSIXct(dateTime)


##Plot 2
plot(subdataset$Global_active_power~subdataset$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Create plot2.png
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()