library(data.table)
library(dplyr)
library(lubridate)

##read in household power comsumption data 
  data <- read.table("./household_power_consumption.txt", na.strings = "?", 
                   header = TRUE, sep = ";", dec = ".")

##open PNG device: creates "plo1.png" in working directory  
  png(filename = "plot4.png", width = 480, height = 480, units = "px")

##convert Date and Time  using lubridate package
  Sys.setlocale("LC_TIME", "US")
  data$Time <- dmy_hms(paste(data$Date, data$Time))

##using data from dates 2007-02-01 (thursday) and 2007-02-01 (friday)
  data$Date <- dmy(data$Date)
  data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

##creating plot4
  par(mfcol=c(2,2))
  #plot Global Active Power
   plot(data$Global_active_power ~ data$Time, type = "l", 
     xlab = "", ylab = "Global Active Power")
  #plot Energy sub metering
   plot(data$Sub_metering_1 ~ data$Time, type = "l", 
     xlab = "", ylab = "Energy sub metering")
   lines(data$Sub_metering_2 ~ data$Time, type = "l", 
      xlab = "", ylab = "Energy sub metering", col = "red")
   lines(data$Sub_metering_3 ~ data$Time, type = "l", 
      xlab = "", ylab = "Energy sub metering", col= "blue")
 #add legend to plot Energy sub metering
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), box.lty=0, lty=1, inset = 0.02, pt.cex = 1.0, cex=0.9)
 #plot Voltage
  plot(data$Voltage ~ data$Time, type = "l", lwd = 0.8,  
      xlab = "datetime", ylab = "Voltage")
 #plot Global active power
  plot(data$Global_reactive_power ~ data$Time, type = "l", lwd = 0.5, 
      xlab = "datetime", ylab = "Global_reactive_power")

##close the PNG file device
  dev.off()