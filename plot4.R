##reading data
householdpower<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",nrows=300000,stringsAsFactors=FALSE,na.strings="?")
head(householdpower)

##cleaning data
householdpower$Date<-as.Date(householdpower$Date,"%d/%m/%Y")
householdpower2<-householdpower[householdpower$Date==c("2007-02-01","2007-02-02"),]
Datetime<-paste(householdpower2$Date,householdpower2$Time)
Sys.setlocale("LC_TIME", "English")
Time2<-strptime(Datetime,"%Y-%m-%d %H:%M:%S")
householdpower2$Datetime<-Time2

##Making Plots
png(file="plot4.png",width = 480,height = 480)
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
#1
plot(x=householdpower2$Datetime,y=householdpower2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#2
plot(x=householdpower2$Datetime,y=householdpower2$Voltage,type="l",ylab="Voltage",xlab="datetime")
#3
plot(x=householdpower2$Datetime,y=householdpower2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(householdpower2$Datetime,householdpower2$Sub_metering_2,col="red")
lines(householdpower2$Datetime,householdpower2$Sub_metering_3,col="blue")
#4
plot(x=householdpower2$Datetime,y=householdpower2$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()