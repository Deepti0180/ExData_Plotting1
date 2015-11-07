#This code will create Plot1 for Project 1

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

#Draw Histogram
hist(project1_data$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")

#Copy to .png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()