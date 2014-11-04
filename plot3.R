
library(sqldf)


#read the data
data<- read.csv.sql("household_power_consumption.txt", 
                    sql = 'select * from file 
                    where (Date == "1/2/2007") | (Date == "2/2/2007")',
                    header = TRUE, sep = ";") 

#set up output file as png 480/480
png (file = "plot3.png",width = 480, height = 480, units = "px", bg=NA)

#Clean the data to create a date/time timestamp
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Generate the line plot (type=l) and add 2 additional lines
plot (data$DateTime, data$Sub_metering_1,  type="l", 
      xlab="", ylab="Energy sub metering",col="black")
lines (data$DateTime, data$Sub_metering_2,  type="l", 
      xlab="", ylab="Energy sub metering",col="red")
lines (data$DateTime, data$Sub_metering_3,  type="l", 
       xlab="", ylab="Energy sub metering",col="blue")

#Create the legend
legend("topright", col = c("black","red","blue"), lty=1,lwd=1, cex=0.8, xjust=0,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#shut down the open devices
dev.off ()
