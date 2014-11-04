
library(sqldf)
data<- read.csv.sql("household_power_consumption.txt", 
                    sql = 'select * from file 
                    where (Date == "1/2/2007") | (Date == "2/2/2007")',
                    header = TRUE, sep = ";") 


hist (data$Global_active_power, col="red", main = "Global Active Power", 
      xlab="Global Active Power (kilowatts)", ylab="Frequency")


dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px", bg=NA)
dev.off ()