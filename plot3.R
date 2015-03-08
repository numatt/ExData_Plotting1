# Plots a line graph of energy sub metering
# Inputs:
#       file: household_power_consumption.txt (in working directory)
# Outputs:
#       file: plot3.png (in working directory)         

plot3 <- function(){
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
    png("plot3.png",width=480,height=480,units="px")
    with(data, plot(rep(Datetime,3),
         c(Sub_metering_1,Sub_metering_2,Sub_metering_3),type="n",xlab="",
         ylab="Energy sub metering"))
    with(data, lines(Datetime,Sub_metering_1))
    with(data, lines(Datetime,Sub_metering_2,col="red"))
    with(data, lines(Datetime,Sub_metering_3,col="blue"))
    legend("topright", lwd = 1, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    dev.off()
    
    invisible()
}