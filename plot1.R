##Title: “plot1.R”
##Author: “Renan Portugal”
##Date: “12/13/2020”


##Loading data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## Format date to Type Date
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
##Use data from 2007-02-01 and 2007-02-02 only
subdataset <- subset(dataset,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

##Plot 1
hist(subdataset$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

##Create plot1.png
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()