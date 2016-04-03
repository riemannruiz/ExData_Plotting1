
##At first, I use the following code to create a subset for the original data in the 
# Loading the original dataset
exdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
inidate=c("2007-02-01")
enddate=c("2007-02-02")
tempdate<-as.Date(exdata$Date,format=c("%d/%m/%Y"))
subexdata<-exdata[(tempdate==inidate)|(tempdate==enddate),]
write.table(subexdata,file = "subexdata.txt",sep = ";")

## Now the next codes use the subexdata.txt for the plots
# load the library
library(ggplot2)

#read de subexdata.txt created by the above code
subexdata<-read.table("subexdata.txt",header=TRUE,sep=";")

#clean the all wrong data "?"
temp<-subexdata[!(subexdata$Global_active_power=="?"),]

# convert the Date data to date format.
temp$Date=as.Date(temp$Date,format=c("%d/%m/%Y"))

# Create the histogram figure
hist(temp,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

# Create de PNG figure
dev.copy(png,file="plot1/plot1.png")
dev.off()