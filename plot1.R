# Read the fiel from Work directory 
houseData <- read.table('.\\Project1\\household_power_consumption.txt',sep=";"
                        , header = TRUE, na.strings = '?')

# Transform type of data for variable Date and variable Time
houseData$Date <- as.Date(houseData$Date, format= "%d/%m/%Y")
#houseData$Time <- strptime(houseData$Time,format="%H:%M:%S")

# Filter source with only two days
houseData <- subset(houseData, 
                    subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Create histogram
hist(houseData$Global_active_power, col="red",  main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")

# Send the image to PNG
dev.copy(png, file="plot1.png",height = 480, width = 480)

#Close device
dev.off()