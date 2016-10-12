## to make plot1
power$Global_active_power<-as.numeric(as.character(power$Global_active_power))
hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)## Plot1.png has been saved in folder
dev.off() ## returns to screen