
library(sqldf)

#read the data
data<- read.csv.sql("household_power_consumption.txt", 
                    sql = 'select * from file 
                    where (Date == "1/2/2007") | (Date == "2/2/2007")',
                    header = TRUE, sep = ";") 


#Clean the data to add a time stamp
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#open the graphics device
png (file = "plot2.png",width = 480, height = 480, units = "px", bg=NA)

#crate the plot
plot (data$DateTime, data$Global_active_power,  type="l", 
      xlab="", ylab="Global Active Power (kilowatts)")


#Turn off the graphics device
dev.off ()
