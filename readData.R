setwd("/Users/vunguyen/DataScience/ExploratoryDataAnalysis")

options(stringsAsFactors = FALSE)
data = data.frame(Date=character(), 
                  Time=character(),
                  Global_active_power=numeric(),
                  Global_reactive_pwer=numeric(),
                  Voltage=numeric(),
                  Global_intensity=numeric(),
                  Sub_metering_1=numeric(),
                  Sub_metering_2=numeric(),
                  Sub_metering_3=numeric())
step = 10000
last.row = 0
for (i in seq(0, 100000/step, 1)) {
  print(paste("reading batch", i))
  temp= read.csv("household_power_consumption.txt", header=FALSE, sep=";", 
                 skip=i*step+1, nrows=step, na.strings="?",
                 colClasses = c("character", "character", rep("numeric", 7)))
  chosens = c(which(temp[ , 1] == "1/2/2007"), which(temp[ , 1] == "2/2/2007"))
  
  if (length(chosens)) {
    #print(paste("found", chosens))
    if (last.row) {
      data[(last.row+1):(last.row+length(chosens)), ] = temp[chosens, ]
    } else {
      data[1:(length(chosens)), ] = temp[chosens, ]
    }
    last.row = last.row + length(chosens)
  }
}
