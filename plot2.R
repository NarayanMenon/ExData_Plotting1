# plot2.R
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

png("plot2.png",width=4.8,height=4.8,units="in",res=100)

plot(power$dtime,power$Global_active_power,xaxt="n",type="n",
     xlab="",ylab="Global active power (kilowatts)")
points(power$dtime,power$Global_active_power,type="l")
axis(1,at=c(min(power$dtime),median(power$dtime),max(power$dtime)),labels=c("Thu","Fri","Sat"))

dev.off()
