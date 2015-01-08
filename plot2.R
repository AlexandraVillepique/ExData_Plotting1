EPC<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
test<-paste(EPC$Date, EPC$Time, sep=" ")
EPC$t<-strptime(test,"%d/%m/%Y %H:%M:%S")
#select=c("2/2/2007","1/2/2007")

d1=strptime("31/1/2007 23:59:59","%d/%m/%Y %H:%M:%S")
d2=strptime("3/2/2007 00:00:00","%d/%m/%Y %H:%M:%S")

eSub<-subset(EPC, d1<t & t<d2 )

with(eSub, plot(t ,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))


png(filename="plot2.png")
with(eSub, plot(t ,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
