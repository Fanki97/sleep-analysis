# Steps to download and unzip the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "UCI_HAR_Dataset.zip"
download.file(url, destfile, method = "curl")
unzip(destfile)

# Load activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "feature"))

# Steps to load training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Steps to load test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Merge the datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Merge x_data, y_data, and subject_data into one data frame
data <- cbind(subject_data, y_data, x_data)

# Extract features related to mean and standard deviation
mean_std_features <- grep("-(mean|std)\\(\\)", features$feature)

# Subset the data to keep only mean and standard deviation features
x_data_mean_std <- x_data[, mean_std_features]

# Assign proper column names to x_data_mean_std
names(x_data_mean_std) <- features[mean_std_features, 2]

# Use descriptive activity names
y_data$activity <- activity_labels[y_data$activity_id, 2]

# Combine subject, y_data, and x_data_mean_std into a tidy dataset
tidy_data <- cbind(subject_data, y_data$activity, x_data_mean_std)
colnames(tidy_data)[2] <- "activity"

# Clean up the variable names
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))

library(dplyr)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Write the final data set to a file
write.table(final_data, "final_data.txt", row.names = FALSE)
