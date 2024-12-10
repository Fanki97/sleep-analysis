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

#Plot 2: Global Active Power Time Series


  # plot2.R
  png("plot2.png", width = 480, height = 480)

# Plot time series of Global Active Power
plot(
  data_subset$DateTime,
  as.numeric(data_subset$Global_active_power),
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

dev.off()