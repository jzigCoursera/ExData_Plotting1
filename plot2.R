function plot2() {
    #Pre : file "household_power_consumption.txt" is located in the 
    #      active working directory
    #Post: plot2.png will output to the working directory
    #summary: this function will generate a chart and write it
    #         to a .png file.
    
    #read in data
    bigFile <- read.csv(file="household_power_consumption.txt", sep=";")
    
    # subset the data to only work with data from 1 and 2 February
    smallFile <- bigFile[(as.Date(bigFile$Date, "%d/%m/%Y") == "2007-02-01") | (as.Date(bigFile$Date, "%d/%m/%Y") == "2007-02-02"),]
    
    #shortcut to xAxis and yAxis for readability
    xAxis <- as.POSIXct(paste(as.Date(smallFile$Date, "%d/%m/%Y"), smallFile$Time))
    yAxis <-  as.numeric(as.character(smallFile$Global_active_power))
    
    #plot the chart
    plot(xAxis, yAxis, type="l", xact='n', xlab="", ylab="Global Active Power (kilowatts)")
    
    
    #write the png file
    dev.copy(png, "plot2.png", width=480, height=480)
    dev.off()
    
}

