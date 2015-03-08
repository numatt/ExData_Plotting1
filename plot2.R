# Plots a line graph of global active power usage
# Inputs:
#       file: household_power_consumption.txt (in working directory)
# Outputs:
#       file: plot2.png (in working directory)    

plot2 <- function(){
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
    
    # Plot the graph
    png("plot2.png",width=480,height=480,units="px")
    plot(data$Datetime,data$Global_active_power,type="l",xlab="",
         ylab="Global Active Power (kilowatts)")
    dev.off()
    
    invisible()
}