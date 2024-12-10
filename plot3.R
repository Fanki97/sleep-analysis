# Load necessary libraries
library(data.table)

# Read the dataset with data.table for efficiency
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")

# Subset data for the specified dates
data_subset <- data[Date %in% c("1/2/2007", "2/2/2007")]

# Combine Date and Time columns into a datetime column
data_subset[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Memory estimation: 
rows <- 2075259
columns <- 9
memory_needed_MB <- (rows * columns * 8) / (1024^2) 
memory_needed_MB

#Plot 3: Sub-Metering Time Series

  
  # plot3.R
  png("plot3.png", width = 480, height = 480)

# Plot time series for Sub_metering_1, Sub_metering_2, and Sub_metering_3
plot(
  data_subset$DateTime,
  as.numeric(data_subset$Sub_metering_1),
  type = "l",
  col = "black",
  xlab = "",
  ylab = "Energy sub metering"
)

lines(data_subset$DateTime, as.numeric(data_subset$Sub_metering_2), col = "red")
lines(data_subset$DateTime, as.numeric(data_subset$Sub_metering_3), col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()