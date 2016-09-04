setwd("~/Coursera/ExData_Plotting1")
png(file="plot4.png", width = 480, height = 480)
x <-read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
x$Date <- as.Date(x$Date,"%d/%m/%Y")
x$Time <-strptime(paste(x$Date,x$Time),"%Y-%m-%d %H:%M:%S")
y<-subset(x,x$Date=="2007-02-01" | x$Date =="2007-02-02")

par(mfrow = c(2, 2))

with(subset(y,Global_active_power!="?"),plot(y$Time,y$Global_active_power, type = "l",xlab="",ylab="Global Active Power"))

with(subset(y,Voltage!="?"),plot(y$Time,y$Voltage, type = "l",xlab="datetime",ylab="Voltage"))

with(subset(y,Sub_metering_1!="?"),plot(y$Time,y$Sub_metering_1, type = "l",xlab="",ylab="Energy sub metering"))
with(subset(y,Sub_metering_2!="?"),points(y$Time,y$Sub_metering_2,type="l", col="red"))
with(subset(y,Sub_metering_3!="?"),points(y$Time,y$Sub_metering_3,type="l", col="blue"))
legend("topright", lty=1, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(subset(y,Global_reactive_power!="?"),plot(y$Time,y$Global_reactive_power, type = "l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()