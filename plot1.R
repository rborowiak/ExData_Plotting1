library(data.table)
library(dplyr)
library(lubridate)

##read in household power comsumption data 
  data <- read.table("./household_power_consumption.txt", na.strings = "?", 
          header = TRUE, sep = ";", dec = ".")

##convert Date using lubridate package
  data$Date <- dmy(data$Date)

##using data from dates 2007-02-01 (thursday) and 2007-02-01 (friday) 
  data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

##open PNG device: creates "plo1.png" in working directory  
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
      
##ploting histogram
  with(data, hist(data$Global_active_power, main = "Global Active Power", 
  xlab = "Global Active Power (kilowatts)", col ="red"))

##close the PNG file device
  dev.off()