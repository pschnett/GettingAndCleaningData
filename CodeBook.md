# Code Book

## Getting and Cleaning Data Project
Steps in the run_analytics.R script

1. Install the 'plyr' package if not already installed and and loads library `plyr`.  Will use one of the function later in these steps.
* Downloads required zip file if it does not exist from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Create a folder to hold the two datasets 
* Extract the features used for col names when creating train and test data sets from file `features.txt` in the zip archive
* Extract and combine the train dataset using `X_train.txt`, `y_train.txt`, `subject_train.txt` where
	* `subject_train` contains the ids used in the id column
	* `y_train` contains the activity label column
	* `X_train` contains the data using the feature from step `4` above as column names 
* Do the same as step `5` above for `X_test.txt`, `y_test.txt`, `subject_test.txt`
* In order to satisfy requirement 1 to `Merge the training and test sets to create one dataset` use `rbind` to merge the train and test data
* Sort the merged data by the id column
* In order to satisfy requirement 3, `Uses descriptive activity names to name the activities in the data set` extract the activity labels from the `activity_labels.txt` from the zip archive
* To satisfy requirement 4 `Appropriately labels the data set with descriptive activity names.` change the data activity variable to use the activity labels from step `9`
* For requirement 2 `Extracts only the measurements on the mean and standard deviation for each measurement.` first tidyup the column names by replacing the periods with underscores for consistency.  Next, subset the `mean`,`std` into dataSet1 using grep on the column names `std` and `mean`
* Saves dataSet1 into `dataSet1.csv` in the destination folder
* For requirement 5 `Creates a second, independent tidy data set with the average of each variable for each activity and each subject.` Uses `ddply` from the `plyr` to apply a column mean on activity for each id
* To make the column names more descriptive append `Mean` to all column names
* Saves the dataset2 into `dataSet2.csv`

## dataSet1.csv
contains 10299 rows and 81 columns in csv format.

### Columns 
* id
* activity
* tBodyAcc_std___X
* tBodyAcc_std___Y
* tBodyAcc_std___Z
* tGravityAcc_std___X
* tGravityAcc_std___Y
* tGravityAcc_std___Z
* tBodyAccJerk_std___X
* tBodyAccJerk_std___Y
* tBodyAccJerk_std___Z
* tBodyGyro_std___X
* tBodyGyro_std___Y
* tBodyGyro_std___Z
* tBodyGyroJerk_std___X
* tBodyGyroJerk_std___Y
* tBodyGyroJerk_std___Z
* tBodyAccMag_std__
* tGravityAccMag_std__
* tBodyAccJerkMag_std__
* tBodyGyroMag_std__
* tBodyGyroJerkMag_std__
* fBodyAcc_std___X
* fBodyAcc_std___Y
* fBodyAcc_std___Z
* fBodyAccJerk_std___X
* fBodyAccJerk_std___Y
* fBodyAccJerk_std___Z
* fBodyGyro_std___X
* fBodyGyro_std___Y
* fBodyGyro_std___Z
* fBodyAccMag_std__
* fBodyBodyAccJerkMag_std__
* fBodyBodyGyroMag_std__
* fBodyBodyGyroJerkMag_std__
* tBodyAcc_mean___X
* tBodyAcc_mean___Y
* tBodyAcc_mean___Z
* tGravityAcc_mean___X
* tGravityAcc_mean___Y
* tGravityAcc_mean___Z
* tBodyAccJerk_mean___X
* tBodyAccJerk_mean___Y
* tBodyAccJerk_mean___Z
* tBodyGyro_mean___X
* tBodyGyro_mean___Y
* tBodyGyro_mean___Z
* tBodyGyroJerk_mean___X
* tBodyGyroJerk_mean___Y
* tBodyGyroJerk_mean___Z
* tBodyAccMag_mean__
* tGravityAccMag_mean__
* tBodyAccJerkMag_mean__
* tBodyGyroMag_mean__
* tBodyGyroJerkMag_mean__
* fBodyAcc_mean___X
* fBodyAcc_mean___Y
* fBodyAcc_mean___Z
* fBodyAcc_meanFreq___X
* fBodyAcc_meanFreq___Y
* fBodyAcc_meanFreq___Z
* fBodyAccJerk_mean___X
* fBodyAccJerk_mean___Y
* fBodyAccJerk_mean___Z
* fBodyAccJerk_meanFreq___X
* fBodyAccJerk_meanFreq___Y
* fBodyAccJerk_meanFreq___Z
* fBodyGyro_mean___X
* fBodyGyro_mean___Y
* fBodyGyro_mean___Z
* fBodyGyro_meanFreq___X
* fBodyGyro_meanFreq___Y
* fBodyGyro_meanFreq___Z
* fBodyAccMag_mean__
* fBodyAccMag_meanFreq__
* fBodyBodyAccJerkMag_mean__
* fBodyBodyAccJerkMag_meanFreq__
* fBodyBodyGyroMag_mean__
* fBodyBodyGyroMag_meanFreq__
* fBodyBodyGyroJerkMag_mean__
* fBodyBodyGyroJerkMag_meanFreq__

## dataset2.csv
contains 180 rows and 81 columns in csv format.

### Columns
* id
* activity
* tBodyAcc_std___X_mean
* tBodyAcc_std___Y_mean
* tBodyAcc_std___Z_mean
* tGravityAcc_std___X_mean
* tGravityAcc_std___Y_mean
* tGravityAcc_std___Z_mean
* tBodyAccJerk_std___X_mean
* tBodyAccJerk_std___Y_mean
* tBodyAccJerk_std___Z_mean
* tBodyGyro_std___X_mean
* tBodyGyro_std___Y_mean
* tBodyGyro_std___Z_mean
* tBodyGyroJerk_std___X_mean
* tBodyGyroJerk_std___Y_mean
* tBodyGyroJerk_std___Z_mean
* tBodyAccMag_std___mean
* tGravityAccMag_std___mean
* tBodyAccJerkMag_std___mean
* tBodyGyroMag_std___mean
* tBodyGyroJerkMag_std___mean
* fBodyAcc_std___X_mean
* fBodyAcc_std___Y_mean
* fBodyAcc_std___Z_mean
* fBodyAccJerk_std___X_mean
* fBodyAccJerk_std___Y_mean
* fBodyAccJerk_std___Z_mean
* fBodyGyro_std___X_mean
* fBodyGyro_std___Y_mean
* fBodyGyro_std___Z_mean
* fBodyAccMag_std___mean
* fBodyBodyAccJerkMag_std___mean
* fBodyBodyGyroMag_std___mean
* fBodyBodyGyroJerkMag_std___mean
* tBodyAcc_mean___X_mean
* tBodyAcc_mean___Y_mean
* tBodyAcc_mean___Z_mean
* tGravityAcc_mean___X_mean
* tGravityAcc_mean___Y_mean
* tGravityAcc_mean___Z_mean
* tBodyAccJerk_mean___X_mean
* tBodyAccJerk_mean___Y_mean
* tBodyAccJerk_mean___Z_mean
* tBodyGyro_mean___X_mean
* tBodyGyro_mean___Y_mean
* tBodyGyro_mean___Z_mean
* tBodyGyroJerk_mean___X_mean
* tBodyGyroJerk_mean___Y_mean
* tBodyGyroJerk_mean___Z_mean
* tBodyAccMag_mean___mean
* tGravityAccMag_mean___mean
* tBodyAccJerkMag_mean___mean
* tBodyGyroMag_mean___mean
* tBodyGyroJerkMag_mean___mean
* fBodyAcc_mean___X_mean
* fBodyAcc_mean___Y_mean
* fBodyAcc_mean___Z_mean
* fBodyAcc_meanFreq___X_mean
* fBodyAcc_meanFreq___Y_mean
* fBodyAcc_meanFreq___Z_mean
* fBodyAccJerk_mean___X_mean
* fBodyAccJerk_mean___Y_mean
* fBodyAccJerk_mean___Z_mean
* fBodyAccJerk_meanFreq___X_mean
* fBodyAccJerk_meanFreq___Y_mean
* fBodyAccJerk_meanFreq___Z_mean
* fBodyGyro_mean___X_mean
* fBodyGyro_mean___Y_mean
* fBodyGyro_mean___Z_mean
* fBodyGyro_meanFreq___X_mean
* fBodyGyro_meanFreq___Y_mean
* fBodyGyro_meanFreq___Z_mean
* fBodyAccMag_mean___mean
* fBodyAccMag_meanFreq___mean
* fBodyBodyAccJerkMag_mean___mean
* fBodyBodyAccJerkMag_meanFreq___mean
* fBodyBodyGyroMag_mean___mean
* fBodyBodyGyroMag_meanFreq___mean
* fBodyBodyGyroJerkMag_mean___mean
* fBodyBodyGyroJerkMag_meanFreq___mean
