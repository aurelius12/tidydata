## Objectives of the script run_analysis.R 

*Merge the training and the test sets to create one data set.
*Extract only the measurements on the mean and standard deviation for each measurement.
*Use descriptive activity names to name the activities in the data set
*Appropriately label the data set with descriptive variable names
*Create a second, independent tidy data set with the average of each variable for each activity and each subject.

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


