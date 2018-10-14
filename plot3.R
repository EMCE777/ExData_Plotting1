# Examine how household energy usage varies over a 2-day period in February, 2007. 

# plot3.R
# To get data from the source
houseData <- read.table(file="./Project1/household_power_consumption.txt",
                        sep = ";", header = T, na.strings = "?")

# To convert datatype for the variable Date
houseData$Date <- as.Date(houseData$Date)

# To filter data for to obtein only two days
houseData <- subset(houseData, 
                    subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Add new variable to keep datatime
houseData$DateTime <- 
        strptime(paste(houseData$Date, houseData$Time), "%Y-%m-%d %H:%M:%S")

# Built plot frame
plot(x=houseData$DateTime, y=houseData$Sub_metering_1, type = "n"
     , ylab = "Energy sub metering", xlab = "")

# line for Sub_metering_1
lines(x=houseData$DateTime, y=houseData$Sub_metering_1, type = "l")

# line for Sub_metering_2
lines(x=houseData$DateTime, y=houseData$Sub_metering_2, type="l", col="red")

# line for Sub_metering_3
lines(x=houseData$DateTime, y=houseData$Sub_metering_3, type = "l", col="blue")

# Add legends for graphics
legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"), col=c("black", "red", "blue"),lty=c(1,1))

# To send a file plot3.png
dev.copy(png, file = "plot3.png")

# Close device 
dev.off()
