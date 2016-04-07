#read data. values "?" are intrepreted as NA. file household_power_consumption.txt should be in the working directory
raw <- read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"))

#remove NA from data
clean <- na.omit(raw)

#convert Date and Time from character vector to date and time
clean$Time = strptime(paste(clean$Date, clean$Time), format = "%d/%m/%Y %H:%M:%S")
clean$Date <-  as.Date(clean$Date, format="%d/%m/%Y")

#subset only relevant dates
data <- subset(clean, Date >= "2007-02-01" & Date <= "2007-02-02")

#plot graph to sceen
with(data, plot(Time, Global_active_power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(data, lines(Time, Global_active_power))

#copy to png device
dev.copy(png, "plot2.png")

#close device
dev.off()