# plot3.R
# This script will create plot1.png

library(data.table)
library(lubridate)
library(dplyr)

# read the dataset
pow_table <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                        dec=".",na.strings="?",as.is=TRUE)

power <- pow_table %>% mutate(f_date = dmy(Date)) %>% 
  filter(f_date %in% c(ymd("2007-02-01"),ymd("2007-02-02")))
power <- power %>% mutate(dtime = as.numeric( (dmy(Date) + hms(Time))) )

png("plot3.png",width=4.8,height=4.8,units="in",res=100)

plot(power$dtime,power$Sub_metering_1,xaxt="n",type="n",
     xlab="",ylab="Energy sub metering")
legend("topright", legend=c("sub metering 1", "sub metering 2", "sub metering 3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8)
points(power$dtime,power$Sub_metering_1,type="l",col="black")
points(power$dtime,power$Sub_metering_2,type="l",col="red")
points(power$dtime,power$Sub_metering_3,type="l",col="blue")
axis(1,at=c(min(power$dtime),median(power$dtime),max(power$dtime)),labels=c("Thu","Fri","Sat"))

dev.off()
