# Our overall goal here is simply to examine how household energy usage varies over a 2-day period 
# in February, 2007. Hstogram of Global Active Power will be constructed using the base plotting system.
#
# Current working directory must contain the data file.

    # read data file
    householdpowerconsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
    # subset just the first 2 days in February 2007
    ebdata <- subset(householdpowerconsumption, subset = householdpowerconsumption$Date=="1/2/2007" | householdpowerconsumption$Date=="2/2/2007")

    # open graphic file device, bitmap format, filename will appear directly in working directory
    png(filename="plot1.png", width=480, height=480)
    # set plot margins
    par(mar=c(5,5,2,2))
    # plot histogram of subset of data, set header, color, etc. 
    with(febdata, hist(Global_active_power, main="Global Active Power", breaks=12, col="red",ylim=c(0,1200), xlab="Global Active Power (kilowatts)"))
    # close graphic file device so file can be written
    dev.off()



