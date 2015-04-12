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
plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

## Saving to file local folder with required size
dev.copy(png, file="plot2.png",  width=480, height=480)
dev.off()
