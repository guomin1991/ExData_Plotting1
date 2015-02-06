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
png(file="plot3.png",width = 480,height = 480)
plot(x=householdpower2$Datetime,y=householdpower2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(householdpower2$Datetime,householdpower2$Sub_metering_2,col="red")
lines(householdpower2$Datetime,householdpower2$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()
