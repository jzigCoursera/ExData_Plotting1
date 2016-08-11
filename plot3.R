function plot3() {
    #Pre : file "household_power_consumption.txt" is located in the 
    #      active working directory
    #Post: plot3.png will output to the working directory
    #summary: this function will generate a chart and write it
    #         to a .png file.
    
    #read in data
    bigFile <- read.csv(file="household_power_consumption.txt", sep=";")
    
    # subset the data to only work with data from 1 and 2 February
    smallFile <- bigFile[(as.Date(bigFile$Date, "%d/%m/%Y") == "2007-02-01") | (as.Date(bigFile$Date, "%d/%m/%Y") == "2007-02-02"),]
    
    #get variables
    xAxis <- as.POSIXct(paste(as.Date(smallFile$Date, "%d/%m/%Y"), smallFile$Time))
    Line1 <- as.numeric(as.character(smallFile$Sub_metering_1))
    Line2 <- as.numeric(as.character(smallFile$Sub_metering_2))
    Line3 <- as.numeric(as.character(smallFile$Sub_metering_3))
    
    #lists for legend
    colorList <- c("black", "red", "blue")
    labelList <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    plot(xAxis, Line1, type="l", xlab="", ylab="Energy sub metering")
    lines(xAxis, Line2, col="red")
    lines(xAxis, Line3, col="blue")
    
    #add the legend
    legend("topright", col=colorList, labelList, lty=1, cex=0.75)
    
    
    #write the png file
    dev.copy(png, "plot3.png", width=480, height=480)
    dev.off()
    
}

