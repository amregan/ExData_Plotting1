# Our overall goal here is simply to examine how household energy usage varies over a 2-day period 
# in February, 2007. Line chart of each Global Active Power measure will be constructed using the base plotting system.
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
    png(filename="plot2.png", width=480, height=480)
    # set plot margins
    par(mar=c(5,5,2,2))
    # plot line chart using subset of data, set labels, etc. 
    with(febdata, plot(DateTime, Global_active_power, type="line", ylab="Global Active Power (kilowatts)", xlab=""))
    # close graphic file device so file can be written
    dev.off()
