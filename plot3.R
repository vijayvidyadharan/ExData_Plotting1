## Load full data from file
full_data <- read.csv("./Data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"') 
full_data$Date <- as.Date(full_data$Date, format = "%d/%m/%Y")

## Subset the data for required dates
data <- subset(full_data, subset=(Date >="2007-02-01" & Date <= "2007-02-02"))

## Free memory by deleting the 'full_data'
rm(full_data)

## Convert to date objects
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the graph
with(data, { 
        plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
        lines(Sub_metering_2~Datetime,col='Red') 
        lines(Sub_metering_3~Datetime,col='Blue') 
}) 

## Add legend to chart
legend("topright", col=c("black", "red", "blue"), lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

## Saving to file local folder with required size
dev.copy(png, file="plot3.png",  width=480, height=480)
dev.off()
