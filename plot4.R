# Plots 4 graphs showing power usage
# Inputs:
#       file: household_power_consumption.txt (in working directory)
# Outputs:
#       file: plot4.png (in working directory) 

plot4 <- function(){
    # Load the data
    data <- read.table("household_power_consumption.txt",
                       header=TRUE,
                       sep=";",
                       colClasses=c(rep("character",2),rep("numeric",7)),
                       na.strings="?",
                       comment.char="")
    
    # Build a datetime column
    data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
    data$Datetime = paste(data$Date,data$Time)
    data$Datetime <- strptime(data$Datetime,format="%d/%m/%Y %H:%M:%S")
    
    # Open the file for writing
    png("plot4.png",width=480,height=480,units="px")
    par(mfrow = c(2, 2))
    
    # Plot 1: global active power
    with(data, plot(Datetime,Global_active_power,type="l",xlab="",
         ylab="Global Active Power"))
    
    # Plot 2: voltage
    with(data, plot(Datetime,Voltage,type="l",xlab="datetime",
         ylab="Voltage"))
    
    # Plot 3: energy sub metering
    with(data, plot(rep(Datetime,3),
                    c(Sub_metering_1,Sub_metering_2,Sub_metering_3),type="n",xlab="",
                    ylab="Energy sub metering"))
    with(data, lines(Datetime,Sub_metering_1))
    with(data, lines(Datetime,Sub_metering_2,col="red"))
    with(data, lines(Datetime,Sub_metering_3,col="blue"))
    legend("topright", lwd = 1, col = c("black", "red", "blue"), bty="n",
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    # Plot 4: global reactive power
    with(data, plot(Datetime,Global_reactive_power,type="l",xlab="datetime",
                    ylab="Global_reactive_power"))
    
    # Close the file
    dev.off()
    
    invisible()
}