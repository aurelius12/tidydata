## Objectives of the script run_analysis.R 

* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive variable names
* Create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Process

* First we need to collect the data from the link provided, download and unzip.
* I have changed the file name from UCI HAR Dataset to rawdata to reduce typing. (pretty lazy)
* Will use data.table package to read .txt files as data frames.
* Read the text components and assign to elements
* Assign self describng names to labels/variables
* Label the XTest and XTrain datasets with variables from Features.
* cbind Test, Train and Subject datasets
* Extract mean and standard deviation variables using grepl function
* Merge the extracted datasets with ActivityLables
* Merge the two resulted datasets to get the total combined dataset with extracted mean and std variables.
* Assign an element to the columns for which we need e average.
* Will use reshape2 package to melt data, calulate mean and create a new reshaped dataset.
* Create tidydataset text file

### Objects used in script
* "ActivityLabels"    "AggrColumns"       "ExtractedTest"     "ExtractedTrain"    "Features"         
* "FinalTestDataSet"  "FinalTrainDataSet" "MeltData"          "MergedDataSet"     "YTrain"  
* "SubjectTest"       "SubjectTrain"      "TestDataSet"       "TidyDataSet"       "TrainDataSet"     
* "url"               "XTest"             "XTrain"            "YTest"     

### Variables in tidydataset.txt
"SubjectID" "ActivityType" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" "tBodyAcc-std()-Y" "tBodyAcc-std()-Z" "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" "tGravityAcc-std()-X" "tGravityAcc-std()-Y" "tGravityAcc-std()-Z" "tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z" "tBodyAccJerk-std()-X" "tBodyAccJerk-std()-Y" "tBodyAccJerk-std()-Z" "tBodyGyro-mean()-X" "tBodyGyro-mean()-Y" "tBodyGyro-mean()-Z" "tBodyGyro-std()-X" "tBodyGyro-std()-Y" "tBodyGyro-std()-Z" "tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" "tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y" "tBodyGyroJerk-std()-Z" "tBodyAccMag-mean()" "tBodyAccMag-std()" "tGravityAccMag-mean()" "tGravityAccMag-std()" "tBodyAccJerkMag-mean()" "tBodyAccJerkMag-std()" "tBodyGyroMag-mean()" "tBodyGyroMag-std()" "tBodyGyroJerkMag-mean()" "tBodyGyroJerkMag-std()" "fBodyAcc-mean()-X" "fBodyAcc-mean()-Y" "fBodyAcc-mean()-Z" "fBodyAcc-std()-X" "fBodyAcc-std()-Y" "fBodyAcc-std()-Z" "fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" "fBodyAccJerk-mean()-Z" "fBodyAccJerk-std()-X" "fBodyAccJerk-std()-Y" "fBodyAccJerk-std()-Z" "fBodyGyro-mean()-X" "fBodyGyro-mean()-Y" "fBodyGyro-mean()-Z" "fBodyGyro-std()-X" "fBodyGyro-std()-Y" "fBodyGyro-std()-Z" "fBodyAccMag-mean()" "fBodyAccMag-std()" "fBodyBodyAccJerkMag-mean()" "fBodyBodyAccJerkMag-std()" "fBodyBodyGyroMag-mean()" "fBodyBodyGyroMag-std()" "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"

