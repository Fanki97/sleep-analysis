# Human Activity Recognition Using Smartphones

This project is part of the "Getting and Cleaning Data" course. The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset. The dataset used in this project comes from accelerometers from the Samsung Galaxy S smartphone.

## Project Structure

The repository contains the following files:
  - `run_analysis.R`: The script that performs the analysis.
- `CodeBook.md`: Describes the variables, data, and any transformations used in the analysis.
- `tidy_data.txt`: The final output file, which contains the tidy data set.

## Instructions for running the script

1. Download the dataset from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip it in your working directory.
2. Make sure the `run_analysis.R` script is placed in the same working directory.
3. Run the `run_analysis.R` script. It will:
  - Merge the training and test sets into one dataset.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Label the activities with descriptive activity names.
- Label the dataset with descriptive variable names.
- Create a tidy dataset with the average of each variable for each activity and each subject, saved as `tidy_data.txt`.

4. The output will be saved as `tidy_data.txt`.

## Dependencies

This script uses the following R packages:
  - `dplyr`
