## Load full data from file
full_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, comment.char="", quote='\"')
full_data$Date <- as.Date(full_data$Date, format = "%d/%m/%Y")

## Subset the data for required dates
data <- subset(full_data, subset=(Date >="2007-02-01" & Date <= "2007-02-02"))

## Free memory by deleting the 'full_data'
rm(full_data)

## Convert to date objects
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the graph
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file local folder with required size
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
