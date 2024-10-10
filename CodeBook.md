# CodeBook for Human Activity Recognition Using Smartphones Data

## Data Source

The data used in this project comes from the "Human Activity Recognition Using Smartphones Dataset", which can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data Description

The data contains measurements collected from the accelerometers and gyroscope of the Samsung Galaxy S smartphone while subjects performed different activities such as walking, sitting, and laying down.

## Variables in the Final Tidy Dataset

The final tidy dataset contains the following variables:
- `subject`: The ID of the subject who performed the activity (integer).
- `activity`: The name of the activity (factor).
- Measurement variables: Each of the remaining columns represents a specific feature (like `tBodyAccMeanX`, `tBodyAccMeanY`, etc.) with the mean value for that subject and activity.

### Extracted Features
- The script extracts only the measurements on the mean and standard deviation for each measurement. The features selected were the ones with `mean()` or `std()` in their names.

### Activity Labels
- The following activities were used in the dataset:
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`

## Transformations Performed

1. The training and test datasets were merged to create a single dataset.
2. Measurements on the mean and standard deviation for each measurement were extracted.
3. The activity labels were applied to replace the numeric activity codes.
4. Descriptive variable names were assigned to each column in the dataset.
5. A second independent tidy dataset was created, containing the average of each variable for each activity and subject.

## Final Output

The final dataset, `tidy_data.txt`, contains 180 rows and 68 variables, where each row represents the average of each variable for each subject and activity.