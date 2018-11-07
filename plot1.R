# plot1.R
# This script will create plot1.png

library(data.table)
library(lubridate)
library(dplyr)

# read the dataset
pow_table <- read.table("household_power_consumption.txt",sep=";",header=TRUE,dec=".",na.strings="?")

power <- pow_table %>% mutate(f_date = dmy(Date)) %>% 
      filter(f_date %in% c(ymd("2007-02-01"),ymd("2007-02-02")))

png("plot1.png",width=4.8,height=4.8,units="in",res=100)
with(power,hist(Global_active_power,col="red",main="Global active power",xlab="Global active power (kilowatts)"))
dev.off()