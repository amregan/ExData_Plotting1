# Our overall goal here is simply to examine how household energy usage varies over a 2-day period 
# in February, 2007. Four charts are constructed using the base plotting system.
# Global active power, sub metering, voltage and Global reactive power
#
# Current working directory must contain the data file.

    # read data file
    householdpowerconsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
    # subset just the first 2 days in February 2007
    febdata <- subset(householdpowerconsumption, subset = householdpowerconsumption$Date=="1/2/2007" | householdpowerconsumption$Date=="2/2/2007")
    
    # combine date and time to be used in X axis
    febdata$Date <- as.Date(febdata$Date, format = "%d/%m/%Y")
    febdata$DateTime <- as.POSIXct(paste(febdata$Date, febdata$Time))
    
    # open graphic file device, bitmap format, filename will appear directly in working directory
    png(filename="plot4.png", width=480, height=480)
    # set plot margins
    par(mar=c(5,5,2,2))
    # set are to contain 4 charts - 2 by 2
    par(mfcol=c(2,2))
    
    # first column, first row - plot2
    with(febdata, plot(DateTime, Global_active_power, type="line", ylab="Global Active Power", xlab=""))
    
    # first column, second row - plot3
    # set plot margins
    par(mar=c(5,5,2,2))
    # plot line chart using subset of data and 3 different variables, set labels, color, etc. 
    with(febdata, plot(DateTime, Sub_metering_1, "n", ylab="Energy sub metering", xlab=""))
    with(febdata, points(DateTime, Sub_metering_1, type = "l"))
    with(febdata, points(DateTime, Sub_metering_2, type = "l", col="red"))
    with(febdata, points(DateTime, Sub_metering_3, type = "l", col="blue"))
    # add legend
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=.8, bty="n", col = c("black", "red", "blue"), lty=c(1,1,1))
    
    # second column, first row - new line chart
    with(febdata, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime"))
    
    # second column, second row - new line chart
    with(febdata, plot(DateTime, Global_reactive_power, type="l",  xlab="datetime"))
    axis(2, at=seq(0.0,0.6,0.1))
    dev.off()
