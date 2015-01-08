EPC<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
test<-paste(EPC$Date, EPC$Time, sep=" ")
EPC$t<-strptime(test,"%d/%m/%Y %H:%M:%S")

d1=strptime("31/1/2007 23:59:59","%d/%m/%Y %H:%M:%S")
d2=strptime("3/2/2007 00:00:00","%d/%m/%Y %H:%M:%S")

eSub<-subset(EPC, d1<t & t<d2 )
drops<-c("Date", "Time")
eS<-eSub[,!names(eSub) %in% drops]

par(mfrow=c(2,2),mar=c(4,4,1,1))

with(eS, {
      plot(t ,Global_active_power, type="l", ylab="Global Active Power", xlab="")
      plot(t ,Voltage, type="l", ylab="Voltage", xlab="")
      plot(t ,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
      lines(t, Sub_metering_2, col="red")
      lines(t, Sub_metering_3, col="blue")
      legend("topright",pch="_",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      plot(t ,Global_reactive_power, type="l", ylab="Global Active Power", xlab="")
})


png(filename="plot4.png")
par(mfrow=c(2,2),mar=c(4,4,1,1))

with(eS, {
      plot(t ,Global_active_power, type="l", ylab="Global Active Power", xlab="")
      plot(t ,Voltage, type="l", ylab="Voltage", xlab="datatime")
      plot(t ,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
      lines(t, Sub_metering_2, col="red")
      lines(t, Sub_metering_3, col="blue")
      legend("topright",pch="_",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      plot(t ,Global_reactive_power, type="l", ylab="Global Reactive Power", xlab="datatime")
})

dev.off()
