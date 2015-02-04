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
png(file="plot2.png",width = 480,height = 480)
plot(x=householdpower2$Datetime,y=householdpower2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()