#read data. values "?" are intrepreted as NA. file household_power_consumption.txt should be in the working directory
raw <- read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"))

#remove NA from data
clean <- na.omit(raw)

#convert Date and Time from character vector to date and time
clean$Time = strptime(paste(clean$Date, clean$Time), format = "%d/%m/%Y %H:%M:%S")
clean$Date <-  as.Date(clean$Date, format="%d/%m/%Y")

#subset only relevant dates
data <- subset(clean, Date >= "2007-02-01" & Date <= "2007-02-02")

#plot directly to png. When copying from screen, some parts of graph are missing
png("plot3.png")

with(data, plot(Time, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
with(data, lines(Time, Sub_metering_1))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))

#add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), text.col = c("black", "red", "blue"), lty = c(1,1,1))

#close device
dev.off()