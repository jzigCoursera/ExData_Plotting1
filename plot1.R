function plot1() {
    #Pre : file "household_power_consumption.txt" is located in the 
    #      active working directory
    #Post: plot1.png will output to the working directory
    #summary: this function will generate a histogram and write it
    #         to a .png file.
    
    #read in data
    bigFile <- read.csv(file="household_power_consumption.txt", sep=";")
    
    # subset the data to only work with data from 1 and 2 February
    smallFile <- bigFile[(as.Date(bigFile$Date, "%d/%m/%Y") == "2007-02-01") | (as.Date(bigFile$Date, "%d/%m/%Y") == "2007-02-02"),]
    
    #generic find the hist, this answers plot1 generation
    hist(as.numeric(as.character(smallFile$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    #write the png file
    dev.copy(png, "plot1.png", width=480, height=480)
    dev.off()
    
}
