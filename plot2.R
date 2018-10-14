# Examine how household energy usage varies over a 2-day period in February, 2007. 

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

# Build frame with labels
plot(x=houseData$DateTime, y=houseData$Global_active_power, 
     type = "n", ylab = "Global Active Power (kilowatts)", xlab="")

# Build lines in frame in accord with the data
lines(x=houseData$DateTime, y=houseData$Global_active_power, type = "l")


# To send to PNG device
dev.copy(png,file="plot2.png", height = 480, width = 480)

#Close device
dev.off()



