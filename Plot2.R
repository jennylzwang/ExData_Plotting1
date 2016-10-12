## to make plot2
power<-transform(power, newtime=as.POSIXct(paste(Date, Time))) ## set a new varialbe
plot(power$newtime, power$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)## Plot2.png has been saved in folder
dev.off() ## returns to screen