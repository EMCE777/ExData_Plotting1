# Examine how household energy usage varies over a 2-day period in February, 2007. 

# Plot 4
# To obtein data from source
houseData <- read.table(file="./Project1/household_power_consumption.txt",
                        header = T, sep=";", na.strings = "?")

# Transform data type from Date variable
houseData$Date <- as.Date(houseData$Date, format="%d/%m/%Y")

# Filter data why two dates
houseData <- subset(houseData, 
                    subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


# Add new variable to keep datatime
houseData$DateTime <- 
        strptime(paste(houseData$Date, houseData$Time), "%Y-%m-%d %H:%M:%S")


# Divide plot two columns and two rows
par(mfrow = c(2, 2))

# Built the first graphic
        # Build frame with labels
        plot(x=houseData$DateTime, y=houseData$Global_active_power, 
             type = "l", ylab = "Global Active Power", xlab="")


# Built the second graphic
        # Build frame with labels
        plot(x=houseData$DateTime, y=houseData$Voltage, 
             type = "l", ylab = "Voltage", xlab="datetime")
      
# Built the third graphic
        # Build frame with labels
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

# Built the fourth graphic
        plot(y=houseData$Global_reactive_power, x=houseData$DateTime, type = "l",
             ylab= "Global_reactive_power", xlab="datetime")
        
        
# To send to PNG device
dev.copy(png,file="plot4.png", height = 480, width = 480)

#Close device
dev.off()
