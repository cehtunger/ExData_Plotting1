#read data. values "?" are intrepreted as NA. file household_power_consumption.txt should be in the working directory
raw <- read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"))

#remove NA from data
clean <- na.omit(raw)

#convert Date from character vector to date
clean$Date <-  as.Date(clean$Date, format="%d/%m/%Y")

#subset only relevant dates
data <- subset(clean, Date >= "2007-02-01" & Date <= "2007-02-02")

#plot histogram to screen
hist(aa$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "frequency", col = "red", main = "Global Active Power")

#copy to png device
dev.copy(png, "plot1.png")

#close device
dev.off()