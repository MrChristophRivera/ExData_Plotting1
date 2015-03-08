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


#plot the time series. 
png('plot2.png', width = 480, height = 480)
plot(x=power$DateTime,y=power$Global_active_power, type= 'l', ylab = 'Global Active Power (kilowatts)', xlab= '' )
dev.off()