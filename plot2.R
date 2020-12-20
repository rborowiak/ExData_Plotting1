library(data.table)
library(dplyr)
library(lubridate)

##read in household power comsumption data 
  data <- read.table("./household_power_consumption.txt", na.strings = "?", 
          header = TRUE, sep = ";", dec = ".")

##open PNG device: creates "plo1.png" in working directory  
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  
##convert Date and Time  using lubridate package
  #Sys.setlocale("LC_TIME", "German")
  Sys.setlocale("LC_TIME", "US")
  #curr_locale <- Sys.getlocale("LC_TIME")
  #Sys.setlocale("LC_TIME", curr_locale)
  data$Time <- dmy_hms(paste(data$Date, data$Time))
  
##using data from dates 2007-02-01 (thursday) and 2007-02-01 (friday)
  data$Date <- dmy(data$Date)
  data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02") 
  
##creating plot2
  plot(data$Global_active_power ~ data$Time, type = "l", 
       xlab = "", ylab = "Global Active Power (kilowatts)")

##close the PNG file device
  dev.off()