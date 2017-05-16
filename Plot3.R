

library(dplyr)
getwd()
setwd("C:/Learning/Coursera/Data Science/Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?")

epc_data <- data

epc_data$Global_active_power <- as.numeric(epc_data$Global_active_power)

epc_data <- epc_data %>% mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date >= "2007-02-01", Date <= "2007-02-02")

epc_data$Time <- strptime(paste(epc_data$Date, epc_data$Time), "%Y-%m-%d %H:%M:%S")

plot(epc_data$Time, epc_data$Sub_metering_1,
     type="l",xlab="",
     ylab="Energy sub metering")
lines(epc_data$Time, epc_data$Sub_metering_2, col="red")
lines(epc_data$Time, epc_data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, box.lwd = 0)

dev.copy(png, "plot3.png" , width=400, height=400)
dev.off()
