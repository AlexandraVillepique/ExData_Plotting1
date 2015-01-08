EPC<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

select=c("2/2/2007","1/2/2007")

eSub<-subset(EPC, Date %in% select)

gap<-eSub$Global_active_power
hist(gap,breaks=20,main="Global Active Power", xlab="Global Active Power (kW)",col="red")

png(filename="plot1.png")
hist(gap,breaks=20,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()
