
library(sqldf)


#read the data
data<- read.csv.sql("household_power_consumption.txt", 
                    sql = 'select * from file 
                    where (Date == "1/2/2007") | (Date == "2/2/2007")',
                    header = TRUE, sep = ";") 

#set up output file as png 480/480
png (file = "plot4.png",width = 480, height = 480, units = "px", bg=NA)

#set up a 2x2 plot area
par(mfrow = c(2, 2))

#Clean the data to create a date/time timestamp
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#
#Plot 1 - Top Left
#
plot (data$DateTime, data$Global_active_power,  type="l", 
      xlab="", ylab="Global Active Power",col="black")


#
#Plot 2 - Top Right
#
plot (data$DateTime, data$Voltage,  type="l", 
      xlab="datetime", ylab="Voltage",col="black")

#
#
# Plot 3 - bottom Left
#Generate the line plot (type=l) and add 2 additional lines
plot (data$DateTime, data$Sub_metering_1,  type="l", 
      xlab="", ylab="Energy sub metering",col="black")
lines (data$DateTime, data$Sub_metering_2,  type="l", 
      xlab="", ylab="Energy sub metering",col="red")
lines (data$DateTime, data$Sub_metering_3,  type="l", 
       xlab="", ylab="Energy sub metering",col="blue")

#Create the legend
legend("topright", col = c("black","red","blue"), lty=1,lwd=1, cex=0.8, bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#
#Plot 4 - Bottom Right
#
plot (data$DateTime, data$Global_reactive_power,  type="l", 
      xlab="datetime", ylab="Global_reactive_power",col="black")

#shut down the open devices
dev.off ()
