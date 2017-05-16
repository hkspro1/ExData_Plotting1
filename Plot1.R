
library(dplyr)
getwd()
setwd("C:/Learning/Coursera/Data Science/Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?")

epc_data <- data

epc_data$Global_active_power <- as.numeric(epc_data$Global_active_power)

epc_data <- epc_data %>% mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
 filter(Date >= "2007-02-01", Date <= "2007-02-02")


epc_data %>% group_by(Date)%>% 
  mutate(Global_active_power = sum(Global_active_power))

Plot1 <- hist(epc_data$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, "plot1.png" , width=400, height=400)
dev.off()
