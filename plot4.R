#This code will create Plot4 for Project 1

# Data is initially loaded into my_table
my_table<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

# Data selected for specific date into project1_data. my_table discarded
project1_data<-my_table[my_table$Date %in% c("1/2/2007","2/2/2007"),]
rm(my_table)

#Convert column Datetime into date & time format
project1_data$Datetime <- strptime(paste(project1_data$Date, project1_data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

#Convert data type of power/intensity & metering columns in Numeric.
project1_data$Global_active_power<-as.numeric(project1_data$Global_active_power)

project1_data$Global_reactive_power<-as.numeric(project1_data$Global_reactive_power)

project1_data$Voltage<-as.numeric(project1_data$Voltage)

project1_data$Global_intensity<-as.numeric(project1_data$Global_intensity)

project1_data$Sub_metering_1<-as.numeric(project1_data$Sub_metering_1)

project1_data$Sub_metering_2<-as.numeric(project1_data$Sub_metering_2)

project1_data$Sub_metering_3<-as.numeric(project1_data$Sub_metering_3)

#Plotting Plot4

#Combine multiple plots in one graph
par(mfrow = c(2, 2)) 

# 1
plot(project1_data$Datetime, project1_data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#2
plot(project1_data$Datetime, project1_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#3
plot(project1_data$Datetime, project1_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(project1_data$Datetime, project1_data$Sub_metering_2, type="l", col="red")
lines(project1_data$Datetime, project1_data$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

#4
plot(project1_data$Datetime, project1_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


#Copy to .png file
dev.copy(png, file="plot4.png", width=480, height=480)

dev.off()