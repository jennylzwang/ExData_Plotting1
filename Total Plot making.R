##This assignment uses data from the UC Irvine Machine Learning Repository, 
## a popular repository for machine learning datasets.

## load packages
library(dplyr)
library(data.table)
library(datasets)

##1. mannually download the zip file and unzip
setwd("~/Desktop/Coursera/Course 4--Assignment 1") ##set a folder for this assignment
list.files() ##to obtain the zipfile's name
unzip(zipfile="exdata-data-household_power_consumption 11.11.53 AM.zip")
list.files() ## to obtain the unzip file's name

##2. read the file and change the date format
HPC<- read.table("household_power_consumption.txt", header=T, sep=";") 
## use all the argument otherwise u will only see in varialbe "V1"
dim(HPC) ## returns [1] 2075259       9
HPC$Date <- as.Date(HPC$Date, format="%d/%m/%Y")  ## change the date format

##3.set working data from the dates 2007-02-01 and 2007-02-02
power<-subset(HPC, Date=="2007-02-01" | Date=="2007-02-02") ##2880 obs of 9 variables

##4 to make plot1, data has to be numeric
power$Global_active_power<-as.numeric(as.character(power$Global_active_power))
hist(power$Global_active_power, main="Global Active Power", 
                                xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)## Plot1.png has been saved in folder
dev.off() ## returns to screen

## to make plot2
power<-transform(power, newtime=as.POSIXct(paste(Date, Time))) ## set a new varialbe
plot(power$newtime, power$Global_active_power, type="l", 
                                     xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)## Plot2.png has been saved in folder
dev.off() ## returns to screen

## to make plot3
power$Sub_metering_1<-as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2<-as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3<-as.numeric(as.character(power$Sub_metering_3))
## ready to plot:
plot(power$newtime, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(power$newtime, power$Sub_metering_1, type="l",col="black")
lines(power$newtime, power$Sub_metering_2, type="l",col="red")
lines(power$newtime, power$Sub_metering_3, type="l",col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
                                             lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)## Plot2.png has been saved in folder
dev.off() ## returns to screen

##to make plot4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0)) ##set up canvas
plot(power$newtime, power$Global_active_power, type="l", 
                              xlab="", ylab="Global Active Power") ## 1st plot
## 2nd plot
power$Voltage<-as.numeric(as.character(power$Voltage))
plot(power$newtime, power$Voltage, type="l", xlab="datetime", ylab="Voltage")
## 3rd plot
plot(power$newtime, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(power$newtime, power$Sub_metering_1, type="l",col="black")
lines(power$newtime, power$Sub_metering_2, type="l",col="red")
lines(power$newtime, power$Sub_metering_3, type="l",col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))
## 4th plot
power$Global_reactive_power<-as.numeric(as.character(power$Global_reactive_power))
plot(power$newtime, power$Global_reactive_power, type="l", 
                                     xlab="datetime", ylab="Global_reactive_power")
## copy to png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off() ## returns to screen

## Knit the R, and the end





