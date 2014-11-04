
library(sqldf)
data<- read.csv.sql("household_power_consumption.txt", 
                    sql = 'select * from file 
                    where (Date == "1/2/2007") | (Date == "2/2/2007")',
                    header = TRUE, sep = ";") 

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot (data$DateTime, data$Global_active_power,  type="l", 
      xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png, file = "plot2.png",width = 480, height = 480, units = "px", bg=NA)
dev.off ()
