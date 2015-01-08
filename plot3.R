EPC<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
test<-paste(EPC$Date, EPC$Time, sep=" ")
EPC$t<-strptime(test,"%d/%m/%Y %H:%M:%S")

d1=strptime("31/1/2007 23:59:59","%d/%m/%Y %H:%M:%S")
d2=strptime("3/2/2007 00:00:00","%d/%m/%Y %H:%M:%S")

eSub<-subset(EPC, d1<t & t<d2 )
drops<-c("Date", "Time")
eS<-eSub[,!names(eSub) %in% drops]

with(eS, {plot(t ,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
          lines(t, Sub_metering_2, col="red")
          lines(t, Sub_metering_3, col="blue")
          })
legend("topright",pch="_",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png(filename="plot3.png")
with(eS, {plot(t ,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
          lines(t, Sub_metering_2, col="red")
          lines(t, Sub_metering_3, col="blue")
})
legend("topright",pch="___",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
