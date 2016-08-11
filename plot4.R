function plot4() {
    #Pre : file "household_power_consumption.txt" is located in the 
    #      active working directory
    #Post: plot4.png will output to the working directory
    #summary: this function will generate four charts and write 
    #         them to a .png file.
    
    #read in data
    bigFile <- read.csv(file="household_power_consumption.txt", sep=";")
    
    # subset the data to only work with data from 1 and 2 February
    smallFile <- bigFile[(as.Date(bigFile$Date, "%d/%m/%Y") == "2007-02-01") | (as.Date(bigFile$Date, "%d/%m/%Y") == "2007-02-02"),]
    
    #this is actually four charts, (charts A, B, C, and D)
    # charts A and B are repeat of plots 2 and 3 from this assignment with minor 
    # alterations to them
    # then a new chart plotting voltage over time (C)
    # and another chart plotting global_active_power over time (D)
    
    
    #============================================
    #assemble axis data for all four charts
    
    #xAxis is common to all four charts, declare it once here
    xAxis <- as.POSIXct(paste(as.Date(smallFile$Date, "%d/%m/%Y"), smallFile$Time))
    
    #chart A
    yAxis <-  as.numeric(as.character(smallFile$Global_active_power))
    
    #chart B
    #get variables for chart B
    VoltageLine <- as.numeric(as.character(smallFile$Voltage))
    
    #chart C
    Line1 <- as.numeric(as.character(smallFile$Sub_metering_1))
    Line2 <- as.numeric(as.character(smallFile$Sub_metering_2))
    Line3 <- as.numeric(as.character(smallFile$Sub_metering_3))
    #lists for chartC's legend
    colorList <- c("black", "red", "blue")
    labelList <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    
    #chart D
    GRPLine <- as.numeric(as.character(smallFile$Global_reactive_power))
    
    
    #=================================================
    #now that we have all the data ready, plot the data
    
    #first split up the plotting area
    par(mfrow=c(2,2))
    
    #plot  chart A
    plot(xAxis, yAxis, type="l", xact='n', xlab="", ylab="Global Active Power")
    
    #plot chart B
    plot(xAxis, VoltageLine, type="l", xlab="datetime", ylab="Voltage")
    
    #plot chart C
    plot(xAxis, Line1, type="l", xlab="", ylab="Energy sub metering")
    lines(xAxis, Line2, col="red")
    lines(xAxis, Line3, col="blue")
    #add the legend
    legend("topright", col=colorList, labelList, lty=1, bty="n", cex=0.5)
    
    #plot chart D
    plot(xAxis, GRPLine, type="l", xlab="datetime", ylab="Global_reactive_power", lwd=1)
    
    
    
    #write the png file
    dev.copy(png, "plot4.png", width=480, height=480)
    dev.off()
    
}

