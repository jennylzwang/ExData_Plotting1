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