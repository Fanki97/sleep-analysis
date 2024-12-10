# Unzip the file
unzip("exdata_data_household_power_consumption.zip", exdir = "data")

list.files("data")

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


Plot 1: Global Active Power Histogram

  # plot1.R
  png("plot1.png", width = 480, height = 480)

# Plot histogram of Global Active Power
hist(
  as.numeric(data_subset$Global_active_power),
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  breaks = 50
)

dev.off()

