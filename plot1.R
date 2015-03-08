# Plots a historgram of global active power usage
# Inputs:
#       file: household_power_consumption.txt (in working directory)
# Outputs:
#       file: plot1.png (in working directory) 

plot1 <- function(){
    # Load the data
    data <- read.table("household_power_consumption.txt",
                       header=TRUE,
                       sep=";",
                       colClasses=c(rep("character",2),rep("numeric",7)),
                       na.strings="?",
                       comment.char="")
    
    # Plot the histogram
    png("plot1.png",width=480,height=480,units="px")
    hist(data$Global_active_power, col="red", main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    dev.off()
    
    invisible()
}