require(lubridate)
rm(list = ls())
#Load the data- this assumes that the file has been decompressed and is in the same directory as this code. 
power<- read.table('household_power_consumption.txt', sep =';', header = TRUE ) 


#convert the first two columns to character
power[[1]]<- as.character(power[[1]])
power[[2]] <-as.character(power[[2]])

#Subset to the desired dates
power <-subset(power, Date %in% c("2/2/2007", "1/2/2007"))

#create a new string with Date time 
power$DateTime<- paste(power$Date, power$Time)

#convert to a useful date time using lubridate
power$DateTime<- parse_date_time(power$DateTime,'dmy hms')


#plot multiplot

png('plot4.png')
#plot 4x4
par(mfrow=c(2,2))
#first
plot(x=power$DateTime,y=power$Global_active_power, type= 'l', ylab = 'Global Active Power (kilowatts)', xlab= '' )
#second

plot(x=power$DateTime,y=power$Voltage, type= 'l', ylab = 'Voltage', xlab= 'datetime' )

#third
plot(x=power$DateTime, y= power$Sub_metering_1, type = 'l', ylab ='Energy sub metering', xlab = '')
lines(x=power$DateTime, y= power$Sub_metering_2, col='red', type = 'l')
lines(x=power$DateTime, y= power$Sub_metering_3, col='blue', type = 'l')

#fourth

plot(x=power$DateTime,y=power$Global_reactive_power, type= 'l', , xlab= 'datetime', ylab ='Global_reactive_power'  )
dev.off()