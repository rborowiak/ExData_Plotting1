library(data.table)
library(dplyr)
library(lubridate)

##read in household power comsumption data 
  data <- read.table("./household_power_consumption.txt", na.strings = "?", 
                   header = TRUE, sep = ";", dec = ".")

##open PNG device: creates "plo1.png" in working directory  
  png(filename = "plot3.png", width = 480, height = 480, units = "px")

##convert Date and Time  using lubridate package
 #Sys.setlocale("LC_TIME", "German")
  Sys.setlocale("LC_TIME", "US")
  data$Time <- dmy_hms(paste(data$Date, data$Time))

##using data from dates 2007-02-01 (thursday) and 2007-02-01 (friday)
  data$Date <- dmy(data$Date)
  data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
  
##plot 
  plot(data$Sub_metering_1 ~ data$Time, type = "l", 
       xlab = "", ylab = "Energy sub metering")
  #par(new = TRUE)
  lines(data$Sub_metering_2 ~ data$Time, type = "l", 
       xlab = "", ylab = "Energy sub metering", col = "red")
  #par(new = TRUE)
  lines(data$Sub_metering_3 ~ data$Time, type = "l", 
       xlab = "", ylab = "Energy sub metering", col= "blue")
  #add legend
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty=1, inset = 0, pt.cex = 1.0, cex=1.0)
  
##close the PNG file device
  dev.off()