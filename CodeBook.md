# "Getting and Cleaning Data" Course Project Code Book

## Main data set
### Info
The data was taken from the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Only the processed data was used, namely - `X`,`y` and `subject` for both the `test` and `train` parts.
The data is stored in `DT` variable.
### Variable names
The variables are:  
1: ID - ID of the subject  
2-67: Signals - (-XYZ suffix is data for X,Y and Z axis, all signals have both mean and standart deviation data)  
tBodyAcc-XYZ   
tGravityAcc-XYZ    
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  
68: activity - name of activity

## Second tidy data set
### Info
This data set holds the mean of the former values for groups of user and activity. 

## Data Cleaning
In order to clean the data, first, user ID was read from `subject_test.txt`, then only the relevant columns for `X_test.txt` were read (those which contain mean and standart deviation data) and their column names were taken from `feautures.txt`, and then the feature index was read from `y_test.txt`, and changed to to its title based on `activity_labels.txt`. Same for `train` data set.
