##course project 1
##part 1
##reading file
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
png(file="plot1.png",width = 480,height = 480)
par(mfrow=c(1,1),mar=c(5,6,4,2))
hist(householdpower2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()