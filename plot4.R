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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(data, { 
        plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
        
        plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="") 
        
        plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
        lines(Sub_metering_2~Datetime,col='Red') 
        lines(Sub_metering_3~Datetime,col='Blue') 
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
        
        plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")       
        
}) 

## Saving to file local folder with required size
dev.copy(png, file="plot4.png",  width=480, height=480)
dev.off()
